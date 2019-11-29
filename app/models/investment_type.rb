class InvestmentType < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[name]

  has_many :invest_projects

  validates :name_uk, :name_en, presence: { message: I18n.t('blank') }
end
