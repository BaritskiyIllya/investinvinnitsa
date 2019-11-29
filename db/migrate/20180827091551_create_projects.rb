class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :alias
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Project.create_translation_table! title: :string, description: :string
      end

      dir.down do
        Project.drop_translation_table!
      end
    end
  end
end
