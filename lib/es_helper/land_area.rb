module EsHelper
  module LandArea
    def as_indexed_json(_params={})
      hash = {}
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        translated_attributes.map { |k, _v| hash[(k + loc).to_sym] = send((k + loc).to_sym) }
      end

      fields = %i[total_area cadastral_number rent sale state_road_distance railway_distance airport_distance phone
                  email]
      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
