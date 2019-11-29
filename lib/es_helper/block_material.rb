module EsHelper
  module BlockMaterial
    def as_indexed_json(_params={})
      {
        block_material_contents: block_material_contents.map { |i|
          { title_en: i.title_en,
            title_uk: i.title_uk,
            description_en: i.description_en,
            description_uk: i.description_uk }
        }
      }
    end
  end
end
