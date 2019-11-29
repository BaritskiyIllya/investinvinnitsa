class CreateMaterialContentColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :material_content_columns do |t|
      t.integer :content_id
      t.string  :color
    end

    reversible do |dir|
      dir.up do
        MaterialContentColumn.create_translation_table! title: :string, value: :string
      end

      dir.down do
        MaterialContentColumn.drop_translation_table!
      end
    end
  end
end
