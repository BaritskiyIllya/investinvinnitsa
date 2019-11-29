class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :token
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
