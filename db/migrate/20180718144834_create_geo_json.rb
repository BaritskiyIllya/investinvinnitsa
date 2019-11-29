class CreateGeoJson < ActiveRecord::Migration[5.2]
  def change
    create_table :geo_json do |t|
      t.string :geo_type
      t.text :coordinates, array: true, default: []
      t.string :gisable_type
      t.integer :gisable_id
    end
  end
end
