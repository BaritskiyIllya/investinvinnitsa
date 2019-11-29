class AddFieldToSubscribe < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :active, :boolean, default: true
  end
end
