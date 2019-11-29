class Api::V1::MapObjectsController < Api::V1::ApiController
  def index
    models = GeoJson.all.pluck(:gisable_type).uniq
    arr = models.map { |model| model.constantize.for_invest_map }
    collection = GeoInfoSystemSerializer.new(arr.flatten).serializable_hash[:data].map { |featur| featur[:attributes] }
    render json: { type: 'FeatureCollection', features: collection }
  end

  def show
    @gis = params[:model].camelize.constantize.find_by(id: params[:id])
    if @gis
      render "api/v1/#{params[:model]}.json.jbuilder"
    else
      render json: {}, status: :not_found
    end
  end

  def layer_links
    @map_layers = []
    MapLayer.active.layer.each do |layer|
      hash = {
        layer_id: layer.id,
        layer_name: layer.title,
        layer_url: layer.map_layer_link.link,
        layer_info: layer.map_layer_link.info.url
      }
      hash[:layer_info] = ENV['INVEST_HOST'] + layer.map_layer_link.info.url if layer.map_layer_link.info.present?
      @map_layers << hash
    end

    render json: { layer_links: @map_layers }
  end
end
