class DropOldCommunalTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :communal_object_names if table_exists?(:communal_object_names)
    drop_table :communal_object_name_translations if table_exists?(:communal_object_name_translations)
    drop_table :communal_object_types if table_exists?(:communal_object_types)
    drop_table :communal_object_type_translations if table_exists?(:communal_object_type_translations)
  end

  def down
    create_table :communal_object_names, &:timestamps

    reversible do |dir|
      dir.up do
        CommunalObjectName.create_translation_table! name: :string
      end

      dir.down do
        CommunalObjectName.drop_translation_table!
      end
    end

    create_table :communal_object_types, &:timestamps

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
