module EsHelper
  module ProductionArea
    def as_indexed_json(_params={})
      hash = {}
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        translated_attributes.map { |k, _v| hash[(k + loc).to_sym] = send((k + loc).to_sym) }
      end

      fields = %i[edrpou_code site railway_distance state_road_distance airport_distance total_area building_year
                  free_floors_count free_floors production_area additional phone email rent_year sale]
      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
