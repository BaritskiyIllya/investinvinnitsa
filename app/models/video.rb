class Video < ApplicationRecord
  translates :short_title, :title, :description, :link, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[short_title title description link]

  belongs_to :video_position

  MAIN = 1

  def self.position(location)
    find_by(video_position_id: const_get(location.upcase))
  end
end
