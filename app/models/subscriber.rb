class Subscriber < ApplicationRecord
  REG_EXP_EMAIL = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates :email, presence: { message: 'Поле не може бути пустим.' }, if: proc { |c| c.email.blank? }, on: :create
  validates :email, uniqueness: true, format: { with: REG_EXP_EMAIL, message: 'Введіть коректний email' }, on: :create

  scope :by_status, ->(status) { where(active: status) }
end
