class CreatePotentialInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_investors do |t|
      t.string :company_name
      t.string :branch
      t.string :product_description
      t.string :project_description
      t.string :novelty
      t.string :budget
      t.string :object
      t.string :land_area
      t.string :area_type
      t.string :infrastructure
      t.string :area
      t.string :transfer_type
      t.string :workers
      t.string :skilled_workers
      t.string :ownership
      t.string :partners
      t.string :comment
      t.string :project_cost
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :site
      t.string :other_info
    end
  end
end
