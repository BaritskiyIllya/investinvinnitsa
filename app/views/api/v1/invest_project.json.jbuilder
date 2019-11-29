json.set! :object do
  json.set! :url, ENV['INVEST_HOST'] + '/invest_projects/' + @gis.id.to_s
end
