class TransportType < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[name]

  has_many :transports
end
