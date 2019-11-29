json.set! :object do
  @gis.gen_info.each do |k, v|
    json.set! k, v
  end

  @gis.characteristic.each do |k, v|
    json.set! k, v
  end

  @gis.operational_costs.each do |k, v|
    json.set! k, v
  end

  @gis.infrastructure.each do |k, v|
    json.set! k, v
  end

  @gis.transfer_to_invest.each do |k, v|
    json.set! k, v
  end

  @gis.person_info.each do |k, v|
    json.set! k, v
  end

  json.set! :balancers, @gis.balancers.map(&:name)
  json.set! :questionnaire_images, @gis.questionnaire_images.map { |image| ENV['INVEST_HOST'] + image.image.url }
  json.set! :infrastructure_types, @gis.infrastructure_types.map(&:name)
  json.set! :main_image, @gis.main_image.present? ? ENV['INVEST_HOST'] + @gis.main_image.url : nil
end
