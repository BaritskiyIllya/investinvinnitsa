class RemoveGeoInfoSystem < ActiveRecord::Migration[5.2]
  def up
    drop_table :geo_info_systems if table_exists?(:geo_info_systems)
    drop_table :geo_info_system_translations if table_exists?(:geo_info_system_translations)
  end

  def down
    create_table :geo_info_systems do |t|
      t.string :gis_type_name
      t.string :title
    end

    GeoInfoSystem.create_translation_table! title: :string if defined? GeoInfoSystem
  end
end
