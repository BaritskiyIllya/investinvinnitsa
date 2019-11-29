class AddFieldToProjects < ActiveRecord::Migration[5.2]
  def up
    add_column :project_translations, :short_description, :string
  end

  def down
    remove_column :project_translations, :short_description
  end
end
