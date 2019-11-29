class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.string :name
      t.string :alias
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        About.create_translation_table! title: :string, information: :string, description: :string
      end
      dir.down do
        About.drop_translation_table!
      end
    end
  end
end
