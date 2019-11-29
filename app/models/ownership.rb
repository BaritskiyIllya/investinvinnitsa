class Ownership < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[name]

  validates :name_uk, presence: { message: I18n.t('blank') }

  has_many :land_areas
  has_many :production_areas
  has_many :invest_projects
end
