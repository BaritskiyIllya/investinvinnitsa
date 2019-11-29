class Content < ApplicationRecord
  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title description]

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
  validates :description_uk, :description_en, length: { maximum: 800, too_long: '%{count} символів максимум' }

  scope :for_tourism, -> {
                        includes(:translations)
                          .where('content_translations.locale': I18n.locale)
                          .where(alias: %w[tourism_historical tourism_facts tourism_useful])
                          .pluck(:alias, 'content_translations.title', 'content_translations.description')
                      }

  scope :without_desc, -> { where(alias: %w[why_vin benefit_index benefit_rating benefit_place benefit_it
                                            watch_video]) }

  scope :with_desc, -> { where(alias: %w[slogan map]) }
end
