class CreateCommunalObjectType < ActiveRecord::Migration[5.2]
  def change
    create_table :communal_object_types do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        CommunalObjectType.create_translation_table! name: :string
      end

      dir.down do
        CommunalObjectType.drop_translation_table!
      end
    end
  end
end
