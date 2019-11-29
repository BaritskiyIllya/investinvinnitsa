class CreateUserLandAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :user_land_areas do |t|
      t.string :area_name
      t.string :area_type
      t.string :total_area
      t.string :underground_engin
      t.string :overhead_engin

      t.string :cadastral_number
      t.string :rent
      t.string :sale

      t.string :state_road_distance, precision: 10, scale: 2
      t.string :railway_distance, precision: 10, scale: 2
      t.string :airport_distance, precision: 10, scale: 2

      t.string :name
      t.string :phone
      t.string :email

      t.string :transfer_type
      t.string :classification
      t.string :configuration
      t.string :building_owner
      t.string :owner

      t.string :gas
      t.string :electricity
      t.string :water_supply
      t.string :drainager
      t.string :ethernet

      t.timestamps
    end
  end
end
