class CreateLandCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :land_categories do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        LandCategory.create_translation_table! name: :string
      end

      dir.down do
        LandCategory.drop_translation_table!
      end
    end
  end
end
