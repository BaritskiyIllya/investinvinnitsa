class AddFieldToProductionAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :production_areas, :state, :integer, limit: 2,  default: 0
    add_column :production_areas, :user_id, :integer
  end
end
