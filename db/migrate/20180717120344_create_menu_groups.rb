class CreateMenuGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_groups do |t|
      t.integer :group_key
      t.string :name
    end

    MenuGroup.create([{ group_key: 1, name: 'Головне' }])
  end
end
