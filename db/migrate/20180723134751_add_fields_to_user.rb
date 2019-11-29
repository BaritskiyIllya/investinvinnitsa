class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone, :string
    add_column :users, :position, :string
    add_column :users, :gender, :string
    add_column :users, :image, :string
    add_column :users, :blocked, :boolean, default: false
    add_column :users, :acquainted, :boolean, default: false
  end
end
