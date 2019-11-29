class InfrastructureType < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[name]

  validates :name_uk, presence: { message: I18n.t('blank') }

  has_many :infra_type_relations
  has_many :land_areas,       through: :infra_type_relations, source: :infrasable, source_type: 'LandArea'
  has_many :office_areas,     through: :infra_type_relations, source: :infrasable, source_type: 'OfficeArea'
  has_many :production_areas, through: :infra_type_relations, source: :infrasable, source_type: 'ProductionArea'
  has_many :invest_projects,  through: :infra_type_relations, source: :infrasable, source_type: 'InvestProject'

  def infrasable
    infra_type_relations.try(:infrasable)
  end
end
