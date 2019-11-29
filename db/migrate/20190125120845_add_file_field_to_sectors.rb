class AddFileFieldToSectors < ActiveRecord::Migration[5.2]
  def up
    add_column :sectors, :file, :string
  end

  def down
    remove_column :sectors, :file
  end
end
