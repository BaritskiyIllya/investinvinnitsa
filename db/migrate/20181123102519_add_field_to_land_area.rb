class AddFieldToLandArea < ActiveRecord::Migration[5.2]
  def up
    LandArea.add_translation_fields! area_name: :string
  end

  def down
    remove_column :land_area_translations, :area_name
  end
end
