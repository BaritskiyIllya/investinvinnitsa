module EsHelper
  module Article
    def as_indexed_json(_params={})
      hash = {}
      fields = %i[description_uk description_en short_description_en short_description_uk title_uk title_en published]

      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
