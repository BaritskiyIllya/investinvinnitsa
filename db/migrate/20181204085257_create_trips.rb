class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :img
      t.integer :position, default: 0
    end

    reversible do |dir|
      dir.up do
        Trip.create_translation_table! title: :string, link: :string
      end

      dir.down do
        Trip.drop_translation_table!
      end
    end

  end
end
