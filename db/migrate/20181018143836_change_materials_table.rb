class ChangeMaterialsTable < ActiveRecord::Migration[5.2]
  def up
    remove_column :materials, :title
    remove_column :materials, :description
    add_column :materials, :link, :string, default: ''
  end

  def down
    remove_column :materials, :link
    add_column :materials, :description, :string, default: ''
    add_column :materials, :title, :string, default: ''
  end
end
