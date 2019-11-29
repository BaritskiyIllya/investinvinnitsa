class CreateCommunalObjectName < ActiveRecord::Migration[5.2]
  def change
    create_table :communal_object_names do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        CommunalObjectName.create_translation_table! name: :string
      end

      dir.down do
        CommunalObjectName.drop_translation_table!
      end
    end
  end
end
