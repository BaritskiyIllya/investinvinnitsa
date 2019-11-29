class CreateRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :representatives do |t|
      t.integer :potential_investor_id
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :site
      t.string :other_info
      t.string :additional
    end
  end
end
