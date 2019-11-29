class CreateBlockMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :block_materials do |t|
      t.string :link
      t.timestamps
    end
  end
end
