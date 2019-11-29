class Team < ApplicationRecord
  translates :last_name, :first_name, :middle_name, :position, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[last_name first_name middle_name position]

  mount_base64_uploader :image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  belongs_to :department, optional: true

  scope :without_department, -> { where(department_id: nil) }
  scope :on_main, -> { where(on_main: true) }

  before_destroy :remove_image

  def remove_image
    image.remove! if image.present?
  end
end
