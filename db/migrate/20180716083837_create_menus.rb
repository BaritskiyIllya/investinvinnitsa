class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string  :link
      t.integer :position
      t.integer :menu_group_id
      t.integer :parent_id, default: 0
      t.boolean :active, default: true
      t.string  :menu_type
    end

    reversible do |dir|
      dir.up do
        Menu.create_translation_table! title: :string, tag_alt: :string
      end

      dir.down do
        Menu.drop_translation_table!
      end
    end
  end
end
