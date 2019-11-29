class AddSortToMapLayer < ActiveRecord::Migration[5.2]
  def up
    add_column :map_layers, :position, :smallint unless column_exists? :map_layers, :position
  end

  def down
    remove_column :map_layers, :position if column_exists? :map_layers, :position
  end
end
