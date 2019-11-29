class MapLayerLink < ApplicationRecord
  mount_uploader :info, ImageUploader, file_name: ->(_u) { SecureRandom.hex }
  belongs_to :map_layer
end
