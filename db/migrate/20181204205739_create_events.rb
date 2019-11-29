class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :period_event
    end

    reversible do |dir|
      dir.up do
        Event.create_translation_table! title: :string
      end

      dir.down do
        Event.drop_translation_table!
      end
    end

  end
end
