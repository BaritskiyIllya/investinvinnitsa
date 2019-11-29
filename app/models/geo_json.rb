class GeoJson < ApplicationRecord
  self.table_name = 'geo_json'
  include RelationLogging

  belongs_to :gisable, polymorphic: true

  def relation_able
    gisable
  end
end
