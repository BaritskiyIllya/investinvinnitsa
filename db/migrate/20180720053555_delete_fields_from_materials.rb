class DeleteFieldsFromMaterials < ActiveRecord::Migration[5.2]
  def up
    remove_column :materials, :file
    remove_column :materials, :image
  end

  def down
    add_column :materials, :file, :string
    add_column :materials, :image, :string
  end
end
