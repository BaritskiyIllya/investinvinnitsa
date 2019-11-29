class CreateBalancerRelation < ActiveRecord::Migration[5.2]
  def change
    create_table :balancer_relations do |t|
      t.integer :balancer_id
      t.references :balanceable, polymorphic: true
    end
  end
end
