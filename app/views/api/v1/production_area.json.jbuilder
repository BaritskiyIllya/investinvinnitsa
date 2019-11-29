json.set! :object do
  @gis.main_information.each do |k, v|
    if k.include?('_id')
      json.set! k.gsub('_id', ''), @gis.public_send(k.gsub('_id', '')).try(:name)
    else
      json.set! k, v
    end
  end

  @gis.tracks.each do |k, v|
    json.set! k, v
  end

  @gis.characteristics.each do |k, v|
    json.set! k, v
  end

  @gis.area_support.each do |k, v|
    json.set! k, v
  end

  @gis.person_info.each do |k, v|
    json.set! k, v
  end

  @gis.invest_conditions.each do |k, v|
    json.set! k, v
  end

  json.set! :balancers, @gis.balancers.map(&:name)
  json.set! :questionnaire_images, @gis.questionnaire_images.map { |image| ENV['INVEST_HOST'] + image.image.url }
  json.set! :infrastructure_types, @gis.infrastructure_types.map(&:name)
  json.set! :main_image, @gis.main_image.present? ? ENV['INVEST_HOST'] + @gis.main_image.url : nil
end
