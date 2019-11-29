class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :img
      t.integer :position, default: 0
    end

    reversible do |dir|
      dir.up do
        Landmark.create_translation_table! title: :string
      end

      dir.down do
        Landmark.drop_translation_table!
      end
    end

  end
end
