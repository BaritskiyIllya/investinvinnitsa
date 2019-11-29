class GeoInfoSystemSerializer
  HOST = ENV['INVEST_HOST']
  include FastJsonapi::ObjectSerializer

  attribute :type do |_object|
    'Feature'
  end

  attribute :geometry do |object|
    position = JSON.parse(object.geo_json.position)
    {
      type: position['type'],
      coordinates: position['coordinates']
    }
  end

  attribute :properties do |object|
    position = JSON.parse(object.geo_json.position)

    default_path = '/google_map_markers/default.png'
    final_icon = object.map_layer.icon.present? ? object.map_layer.icon.url : default_path

    hash = {
      map_layer: object.map_layer_id,
      map_layer_title: object.map_layer.title,
      type: position['type'],
      model: object.class.name,
      id: object[:id],
      request_url: "#{HOST}/api/v1/map_objects/#{object.class.name.underscore}/#{object[:id]}",
      request_link: "#{HOST}/#{object.class.name.underscore.pluralize}/#{object[:id]}",
      request_icon: "#{HOST}#{final_icon}",
      is_communal: object.class.name.eql?('CommunalArea')
    }

    hash[:fillColor] = position['style']['fillColor'] if position['style'].present?
    hash[:strokeColor] = position['style']['strokeColor'] if position['style'].present?
    hash[:icon] = final_icon
    hash[:pop_up] = "Models::#{object.class.name}".classify.constantize.new(object).pop_up
    hash
  end
end
