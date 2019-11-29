class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :title
      t.string :description
      t.string :file
      t.string :image

      t.timestamps
    end
  end
end
