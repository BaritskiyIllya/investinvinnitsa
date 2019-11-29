class AddFieldsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :on_main, :boolean, default: false
    add_column :teams, :trim, :integer
  end
end
