class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.string :title
      t.string :img
      t.string :description
      t.integer :position, default: 0
    end

    reversible do |dir|
      dir.up do
        Sector.create_translation_table! title: :string, description: :string
      end

      dir.down do
        Sector.drop_translation_table!
      end
    end

  end
end
