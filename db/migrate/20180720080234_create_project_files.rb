class CreateProjectFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_files do |t|
      t.string :file
      t.string :locale
      t.references :fileable, polymorphic: true
      t.timestamps
    end
  end
end
