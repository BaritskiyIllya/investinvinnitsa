module EsHelper
  module OfficeArea
    def as_indexed_json(_params={})
      hash = {}
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        translated_attributes.map { |k, _v| hash[(k + loc).to_sym] = send((k + loc).to_sym) }
      end

      fields = %i[edrpou_code site total_area electricity_cost gas_cost water_cost drainager_cost heat_cost
                  city_center_distance transport_stop_distance phone email rent sale]
      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
