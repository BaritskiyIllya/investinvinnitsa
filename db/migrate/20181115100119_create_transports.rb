class CreateTransports < ActiveRecord::Migration[5.2]
  def change
    create_table :transports do |t|
      t.integer :transport_type_id

      t.string :gis_type_name
      t.integer :user_id
      t.integer :state, limit: 2,  default: 0
      t.integer :map_layer_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Transport.create_translation_table! name: :string, route: :string
      end

      dir.down do
        Transport.drop_translation_table!
      end
    end
  end
end
