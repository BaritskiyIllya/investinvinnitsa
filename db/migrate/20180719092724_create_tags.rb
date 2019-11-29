class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.string :alias

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Tag.create_translation_table! title: :string
      end

      dir.down do
        Tag.drop_translation_table!
      end
    end
  end
end
