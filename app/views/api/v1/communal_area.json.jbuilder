json.set! :object do
  @gis.api_attributes.each do |k, v|
    if k.include?('_id')
      json.set! k.gsub('_id', ''), @gis.public_send(k.gsub('_id', '')).try(:name)
    elsif k.eql?('main_image')
      json.set! k, v.present? ? ENV['INVEST_HOST'] + @gis.public_send(k).url : nil
    else
      json.set! k, v
    end
  end
  json.set! :balancers, @gis.balancers.map(&:name)
end
