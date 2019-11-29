class RenameCommunalField < ActiveRecord::Migration[5.2]
  def up
    rename_column :communal_areas, :lang_category_id, :land_category_id if column_exists? :communal_areas, :lang_category_id
  end

  def down
    rename_column :communal_areas, :land_category_id, :lang_category_id if column_exists? :communal_areas, :land_category_id
  end
end
