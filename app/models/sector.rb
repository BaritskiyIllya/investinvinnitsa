class Sector < ApplicationRecord
  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title description]

  mount_uploader :file, FilesUploader
  mount_uploader :img, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
end
