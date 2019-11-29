class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :image
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Review.create_translation_table! last_name: :string, first_name: :string, middle_name: :string, position: :string, description: :string
      end
      dir.down do
        Review.drop_translation_table!
      end
    end
  end
end
