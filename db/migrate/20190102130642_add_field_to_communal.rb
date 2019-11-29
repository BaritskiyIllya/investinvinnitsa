class AddFieldToCommunal < ActiveRecord::Migration[5.2]
  def change
    add_column :communal_areas, :site, :string
  end
end
