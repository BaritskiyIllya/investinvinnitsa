module CommunalAreasHelper
  def layer_partials(object)
    require 'factories/communal'
    partials = Factories::Communal.new(object).available_layers
    return 'general' if partials[object.map_layer_id].blank?
    partials[object.map_layer_id].underscore
  end
end
