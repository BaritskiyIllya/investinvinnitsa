class CreateLandArea < ActiveRecord::Migration[5.2]
  def change
    create_table :land_areas do |t|
      t.integer :area_type, limit: 2
      t.string :total_area
      t.boolean :underground_engin
      t.boolean :overhead_engin

      t.string :cadastral_number
      t.string :rent
      t.string :sale

      t.string :state_road_distance, precision: 10, scale: 2
      t.string :railway_distance, precision: 10, scale: 2
      t.string :airport_distance, precision: 10, scale: 2

      t.string :phone
      t.string :email

      t.string :gis_type_name
      t.string :main_image
      t.integer :user_id
      t.integer :state, limit: 2, default: 0
      t.integer :map_layer_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        LandArea.create_translation_table! name: :string,
                                           transfer_type: :string,
                                           classification: :string,
                                           configuration: :string,
                                           building_owner: :string,
                                           owner: :string,
                                           ethernet: :string,
                                           gas: :string,
                                           electricity: :string,
                                           water_supply: :string,
                                           drainager: :string
      end

      dir.down do
        LandArea.drop_translation_table!
      end
    end
  end
end
