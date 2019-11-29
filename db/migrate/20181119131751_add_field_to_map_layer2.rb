class AddFieldToMapLayer2 < ActiveRecord::Migration[5.2]
  def change
    add_column :map_layer_links, :info, :string, default: ''
  end
end
