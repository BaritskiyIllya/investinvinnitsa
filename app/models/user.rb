class User < ApplicationRecord
  after_initialize :set_default_role
  include RoleModel
  mount_base64_uploader :image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  has_many :production_areas
  has_many :land_areas
  has_many :office_areas
  has_many :communal_areas
  has_many :area_logs
  has_many :transports
  has_many :invest_projects
  has_one :balancer_relation, as: :balanceable, dependent: :destroy
  accepts_nested_attributes_for :balancer_relation, allow_destroy: true

  has_one :balancer, through: :balancer_relation

  roles_attribute :roles_mask
  roles :admin, :user, :moderator, :questionnaire

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.user_roles
    require 'user_roles'
    UserRoles.roles_array
  end

  def self.roles_array_for_moder
    require 'user_roles'
    UserRoles.roles_array_for_moder
  end

  def name
    "#{last_name} #{first_name}"
  end

  def account_active?
    !blocked
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :locked
  end

  def self.check_weight(user, current_user)
    require 'user_weight'
    UserWeight.check(user, current_user)
  end

  protected

  def set_default_role
    self.roles_mask ||= User.mask_for :user
  end
end
