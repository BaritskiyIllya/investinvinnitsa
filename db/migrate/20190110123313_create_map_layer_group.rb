class CreateMapLayerGroup < ActiveRecord::Migration[5.2]
  def up
    create_table :map_layer_groups do |t|
      t.string :alias
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        MapLayerGroup.create_translation_table! title: :string
      end

      dir.down do
        MapLayerGroup.drop_translation_table!
      end
    end

    add_column :map_layers, :map_layer_group_id, :integer, limit: 2
  end

  def down
    remove_column :map_layers, :map_layer_group_id

    drop_table :map_layer_groups if table_exists?(:map_layer_groups)
    drop_table :map_layer_group_translations if table_exists?(:map_layer_group_translations)
  end
end
