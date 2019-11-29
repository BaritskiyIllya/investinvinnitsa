class CreateCabinetOwnerships < ActiveRecord::Migration[5.2]
  def up
    create_table :ownerships do |t|
      t.timestamps
    end

    Ownership.create_translation_table! name: :string

    data = [
        {name_uk: 'Державна', name_en: 'Governmental'},
        {name_uk: 'Приватна', name_en: 'Private'},
        {name_uk: 'Комунальна', name_en: 'Municipal'}
    ]
    Ownership.create(data)

    add_column :production_areas, :ownership_id, :integer
    remove_column :production_area_translations, :ownership if column_exists?(:production_area_translations, :ownership)

    add_column :land_areas, :ownership_id, :integer
    remove_column :land_area_translations, :ownership if column_exists?(:land_area_translations, :ownership)
  end

  def down
    remove_column :production_areas, :ownership_id if column_exists?(:production_areas, :ownership_id)
    add_column :production_area_translations, :ownership, :string

    remove_column :land_areas, :ownership_id if column_exists?(:land_areas, :ownership_id)
    add_column :land_area_translations, :ownership, :string

    drop_table :ownerships
    Ownership.drop_translation_table!
  end
end
