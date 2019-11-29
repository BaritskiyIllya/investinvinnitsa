class CreateCommunalBranch < ActiveRecord::Migration[5.2]
  def change
    create_table :communal_branches do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        CommunalBranch.create_translation_table! name: :string
      end

      dir.down do
        CommunalBranch.drop_translation_table!
      end
    end
  end
end
