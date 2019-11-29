class Advantage < ApplicationRecord
  translates :title, :short_description, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title short_description description]

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
  validates :short_description_uk, :short_description_en, length: { maximum: 800,
                                                                    too_long: '%{count} символів максимум' }
end
