class CreateGeoInfoSystem < ActiveRecord::Migration[5.2]
  def change
    create_table :geo_info_systems do |t|
      t.string :gis_type_name
      t.string :title
    end

    if defined? GeoInfoSystem
      reversible do |dir|
        dir.up do
          GeoInfoSystem.create_translation_table! title: :string
        end

        dir.down do
          GeoInfoSystem.drop_translation_table!
        end
      end
    end
  end
end
