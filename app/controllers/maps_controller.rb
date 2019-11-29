class MapsController < ApplicationController
  skip_before_action :set_locale

  def geo_json_gis
    models = GeoJson.all.pluck(:gisable_type).uniq
    arr = models.map { |model| model.constantize.for_invest_map }
    collection = GeoInfoSystemSerializer.new(arr.flatten).serializable_hash[:data].map { |featur| featur[:attributes] }
    render json: { type: 'FeatureCollection', features: collection }
  end

  def map_layers
    @map_layers = MapLayer.active.layer
  end
end
