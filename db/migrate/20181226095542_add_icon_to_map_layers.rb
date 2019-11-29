class AddIconToMapLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :map_layers, :icon, :string
  end
end
