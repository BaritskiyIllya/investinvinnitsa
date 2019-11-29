module EsHelper
  module InvestProject
    def as_indexed_json(_params={})
      hash = {}
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        translated_attributes.map { |k, _v| hash[(k + loc).to_sym] = send((k + loc).to_sym) }
      end

      fields = %i[invest_sum area hard_cover_road_distance highway_distance railway_distance airport_distance gas
                  electricity water_supply]
      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
