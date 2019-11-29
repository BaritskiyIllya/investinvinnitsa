class CreateSubmissionProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :submission_projects do |t|
      t.text   :description
      t.string :product
      t.string :market_analysis
      t.string :amount
      t.text   :description_needs
      t.string :place
      t.string :area
      t.string :legal_status
      t.string :purpose
      t.string :current_use
      t.text   :project_condition
      t.text   :transport
      t.text   :engineering
      t.string :resource
      t.text   :assets
      t.text   :workforce
      t.text   :permission
      t.text   :ecological
      t.text   :privileges
      t.text   :other
      t.string :name
      t.string :position
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
