class AddTranslateToMaterials < ActiveRecord::Migration[5.2]
  reversible do |dir|
    dir.up do
      Material.create_translation_table! title: :string, description: :string
    end
    dir.down do
      Material.drop_translation_table!
    end
  end
end
