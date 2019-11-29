class AddFieldToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :production_areas, :map_layer_id, :integer
  end
end
