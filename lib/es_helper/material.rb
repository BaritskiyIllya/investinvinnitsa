module EsHelper
  module Material
    def as_indexed_json(_params={})
      hash = {}
      fields = %i[description_uk description_en title_uk title_en]

      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
