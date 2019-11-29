class CreateDepartment < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.integer :position
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Department.create_translation_table! title: :string
      end
      dir.down do
        Department.drop_translation_table!
      end
    end
  end
end
