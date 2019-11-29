class Department < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  has_many :teams

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
end
