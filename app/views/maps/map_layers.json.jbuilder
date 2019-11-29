json.array @map_layers do |layer|
  json.layer_id layer.id
  json.link layer.map_layer_link.link
end
