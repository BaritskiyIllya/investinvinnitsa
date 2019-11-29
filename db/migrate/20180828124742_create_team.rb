class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :linkedin
      t.integer :department_id
      t.string :image

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Team.create_translation_table! last_name: :string, first_name: :string, middle_name: :string, position: :string
      end
      dir.down do
        Team.drop_translation_table!
      end
    end
  end
end
