class CreatePeriodEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :period_events do |t|
      t.integer :position, default: 0
    end

    reversible do |dir|
      dir.up do
        PeriodEvent.create_translation_table! title: :string
      end

      dir.down do
        PeriodEvent.drop_translation_table!
      end
    end

  end
end
