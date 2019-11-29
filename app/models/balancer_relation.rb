class BalancerRelation < ApplicationRecord
  include RelationLogging

  belongs_to :balanceable, polymorphic: true
  belongs_to :balancer

  validates :balancer_id, presence: { message: I18n.t('blank') }, unless: :_destroy

  def relation_able
    balanceable
  end
end
