class ProjectImage < ApplicationRecord
  mount_base64_uploader :image, ProjectImagesUploader, file_name: ->(_u) { SecureRandom.hex }
  belongs_to :imageable, polymorphic: true

  before_destroy :remove_image

  scope :by_locale, ->(locale) { where(locale: locale) }

  def remove_image
    image.remove! if image.present?
  end
end
