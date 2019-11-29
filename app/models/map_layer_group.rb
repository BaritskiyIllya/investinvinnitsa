class MapLayerGroup < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  has_many :map_layers, dependent: :destroy

  validates :alias, uniqueness: { message: 'Такий аліас уже був створений раніше' }
  validates :title_uk, presence: { message: I18n.t('blank') }, if: proc { |map_layer_group| map_layer_group.title_en.blank? }
  validates :title_en, presence: { message: I18n.t('blank') }, if: proc { |map_layer_group| map_layer_group.title_uk.blank? }
end
