class AddFieldToMapLayer < ActiveRecord::Migration[5.2]
  def up
    add_column :map_layers, :layer, :boolean, default: false unless column_exists?(:map_layers, :layer)

    create_table :map_layer_links do |t|
      t.integer :map_layer_id
      t.string :link

      t.timestamps
    end
  end

  def down
    remove_column :map_layers, :layer if column_exists?(:map_layers, :layer)
    drop_table(:map_layer_links, if_exists: true)
  end
end
