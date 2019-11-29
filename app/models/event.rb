class Event < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }

  belongs_to :period_event
end
