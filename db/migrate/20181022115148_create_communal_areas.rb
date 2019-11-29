class CreateCommunalAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :communal_areas do |t|
      t.string :house_number
      t.date :prop_registration
      t.string :cadastral_number
      t.string :area
      t.string :rate_percent
      t.string :year_tax
      t.string :operation_year
      t.integer :level
      t.string :tech_area
      t.string :build_year
      t.boolean :architectural
      t.integer :lang_category_id #prop_type
      t.integer :communal_object_type_id #object_type
      t.integer :communal_object_name_id #object_name
      t.integer :balance_holder_id #balancer
      t.integer :communal_branch_id #branch
      # t.integer :balancer_id #structural_unit

      t.string  :main_image
      t.string  :gis_type_name
      t.integer :user_id
      t.integer :state, limit: 2,  default: 0
      t.integer :map_layer_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        CommunalArea.create_translation_table! field_category: :string,
                                               room: :string,
                                               object_name: :string,
                                               address: :string
      end

      dir.down do
        CommunalArea.drop_translation_table!
      end
    end
  end
end
