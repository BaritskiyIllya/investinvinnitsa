class Cabinet::GeoJsonController < Cabinet::CabinetController
  def index
    object = params[:model].constantize.find_by(id: params[:id].to_i)
    collection = GeoInfoSystemSerializer.new([object]).serializable_hash[:data].map { |featur| featur[:attributes] }
    render json: { type: 'FeatureCollection', features: collection }
  end
end
