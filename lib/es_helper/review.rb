module EsHelper
  module Review
    def as_indexed_json(_params={})
      hash = {}
      fields = %i[description_uk description_en last_name_uk last_name_en first_name_uk first_name_en middle_name_uk
                  middle_name_en position_uk position_en]

      fields.each do |field|
        hash[field] = send(field).to_s
      end
      hash
    end
  end
end
