class CreateAreaLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :area_logs do |t|
      t.integer :user_id
      t.string :logable_type
      t.integer :logable_id
      t.string :description

      t.timestamps
    end
  end
end
