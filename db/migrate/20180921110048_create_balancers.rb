class CreateBalancers < ActiveRecord::Migration[5.2]
  def change
    create_table :balancers do |t|
      t.string :name

      t.timestamps
    end
  end
end
