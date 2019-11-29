class ChangeCommunalAreaFields < ActiveRecord::Migration[5.2]
  def up
    remove_column :communal_areas, :site
    remove_column :communal_areas, :communal_object_name_id
    remove_column :communal_areas, :communal_object_type_id

    CommunalArea.add_translation_fields! object_type: :string
  end

  def down
    remove_column :communal_area_translations, :object_type

    add_column :communal_areas, :site, :string
    add_column :communal_areas, :communal_object_name_id, :integer
    add_column :communal_areas, :communal_object_type_id, :integer
  end
end
