class CreateAdvantages < ActiveRecord::Migration[5.2]
  def change
    create_table :advantages do |t|
      t.string :alias
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Advantage.create_translation_table! title: :string, short_description: :string, description: :string
      end

      dir.down do
        Advantage.drop_translation_table!
      end
    end
  end
end
