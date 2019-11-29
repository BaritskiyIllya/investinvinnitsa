class InfraTypeRelation < ApplicationRecord
  include RelationLogging

  belongs_to :infrasable, polymorphic: true
  belongs_to :infrastructure_type

  validates :infrastructure_type_id, presence: { message: I18n.t('blank') }, unless: :_destroy

  def relation_able
    infrasable
  end
end
