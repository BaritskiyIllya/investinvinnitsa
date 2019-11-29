class MapLayer < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  mount_uploader :icon, MapIconUploader, file_name: ->(_u) { SecureRandom.hex }

  attr_accessor :icon_width, :icon_height

  scope :active, -> { where(active: true) }
  scope :layer, -> { where(layer: true) }

  has_many :production_areas, dependent: :destroy
  has_many :land_areas, dependent: :destroy
  has_many :office_areas, dependent: :destroy
  has_many :communal_areas, dependent: :destroy
  has_many :transports, dependent: :destroy

  has_one :map_layer_link, dependent: :destroy
  accepts_nested_attributes_for :map_layer_link, allow_destroy: true, reject_if: :reject_attributes

  belongs_to :map_layer_group

  validate :validate_minimum_icon_size, if: proc { |obj| obj.icon.present? }
  validate :valid_object

  def reject_attributes
    !layer
  end

  def valid_object
    errors.add(:link, I18n.t('blank')) if layer && map_layer_link.link.blank?
  end

  def validate_minimum_icon_size
    errors.add :icon, 'Розміри іконки мають бути не більше 32х32 пікселів' unless icon.valid_size?
  end
end
