class CreateOfficeArea < ActiveRecord::Migration[5.2]
  def change
    create_table :office_areas do |t|
      t.string :edrpou_code
      t.string :site
      t.string :total_area, precision: 10, scale: 2

      t.string :electricity_cost, precision: 10, scale: 2
      t.string :gas_cost, precision: 10, scale: 2
      t.string :water_cost, precision: 10, scale: 2
      t.string :drainager_cost, precision: 10, scale: 2
      t.string :heat_cost, precision: 10, scale: 2

      t.string :city_center_distance, precision: 10, scale: 2
      t.string :transport_stop_distance, precision: 10, scale: 2

      t.string :phone
      t.string :email

      t.string :rent
      t.string :sale
      t.date   :date_info
      t.string :main_image

      t.string  :gis_type_name
      t.integer :user_id
      t.integer :state, limit: 2,  default: 0
      t.integer :map_layer_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        OfficeArea.create_translation_table! name: :string,
                                             transfer_type: :string,
                                             address: :string,
                                             owner: :string,
                                             gas: :string,
                                             electricity: :string,
                                             water_supply: :string,
                                             drainager: :string,
                                             heat_supply: :string,
                                             ethernet: :string,
                                             phone_sypply: :string,
                                             area_class: :string,
                                             ventilation: :string,
                                             fireproof: :string,
                                             guard: :string,
                                             parking: :string
      end

      dir.down do
        OfficeArea.drop_translation_table!
      end
    end

  end
end
