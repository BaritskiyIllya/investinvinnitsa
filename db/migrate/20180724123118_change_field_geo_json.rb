class ChangeFieldGeoJson < ActiveRecord::Migration[5.2]
  def up
    remove_column :geo_json, :coordinates
    add_column :geo_json, :position, :jsonb, after: :geo_type
  end

  def down
    remove_column :geo_json, :position
    add_column :geo_json, :coordinates, :text, array: true, default: [], after: :geo_type
  end
end
