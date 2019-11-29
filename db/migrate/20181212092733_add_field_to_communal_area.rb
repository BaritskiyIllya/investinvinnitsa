class AddFieldToCommunalArea < ActiveRecord::Migration[5.2]
  def up
    add_column :communal_areas, :site, :string
  end

  def down
    remove_column :communal_areas, :site
  end
end
