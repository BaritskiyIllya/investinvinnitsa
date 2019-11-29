class CreateContent < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :alias
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Content.create_translation_table! title: :string, description: :string
      end

      dir.down do
        Content.drop_translation_table!
      end
    end
  end
end
