class Balancer < ApplicationRecord
  has_many :balancer_relations
  has_many :users,            through: :balancer_relations, source: :balanceable, source_type: 'User'
  has_many :land_areas,       through: :balancer_relations, source: :balanceable, source_type: 'LandArea'
  has_many :office_areas,     through: :balancer_relations, source: :balanceable, source_type: 'OfficeArea'
  has_many :production_areas, through: :balancer_relations, source: :balanceable, source_type: 'ProductionArea'
  has_many :communal_areas,   through: :balancer_relations, source: :balanceable, source_type: 'CommunalArea'
  has_many :invest_projects,  through: :balancer_relations, source: :balanceable, source_type: 'InvestProject'

  validates :name, presence: { message: I18n.t('blank') }

  def balanceable
    balancer_relations.try(:balanceable)
  end
end
