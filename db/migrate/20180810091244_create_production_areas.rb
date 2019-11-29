class CreateProductionAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :production_areas do |t|
      #general info
      t.string :edrpou_code
      t.string :site

      #Access roads
      t.boolean :railway_track, default: false
      t.string :railway_distance, precision: 10, scale: 2
      t.boolean :trucks_road, default: false
      t.string :state_road_distance, precision: 10, scale: 2
      t.string :airport_distance, precision: 10, scale: 2

      # Characteristics of production areas
      t.string :total_area, precision: 10, scale: 2
      t.string :building_year
      t.integer :free_floors_count
      t.string :free_floors
      t.string :production_area, precision: 10, scale: 2
      t.string :additional, precision: 10, scale: 2

      # Contacts
      t.string :phone
      t.string :email

      # Terms of transfer to the investor
      t.string :rent_year
      t.string :sale
      t.date :date_info
      t.string :gis_type_name
      t.string :main_image

      #timestamps
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ProductionArea.create_translation_table! name: :string,
                                                 transfer_type: :string,
                                                 address: :string,
                                                 owner: :string,
                                                 gas: :string,
                                                 electricity: :string,
                                                 water_supply: :string,
                                                 drainager: :string,
                                                 central_heat_supply: :string
      end

      dir.down do
        ProductionArea.drop_translation_table!
      end
    end
  end
end
