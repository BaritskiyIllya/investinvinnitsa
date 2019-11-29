class CreateBlockMaterialContents < ActiveRecord::Migration[5.2]
  def change
    create_table :block_material_contents do |t|
      t.integer :block_material_id
      t.string :image
    end

    reversible do |dir|
      dir.up do
        BlockMaterialContent.create_translation_table! title: :string, description: :text
      end

      dir.down do
        BlockMaterialContent.drop_translation_table!
      end
    end
  end
end
