class AddFieldToBlockContent < ActiveRecord::Migration[5.2]
  def change
    add_column :block_material_contents, :position, :string
  end
end
