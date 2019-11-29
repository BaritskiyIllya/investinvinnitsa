class Trip < ApplicationRecord
  translates :title, :link, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title link]

  mount_base64_uploader :img, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }

  scope :for_tourism, -> { includes(:translations).order(position: :asc) }
end
