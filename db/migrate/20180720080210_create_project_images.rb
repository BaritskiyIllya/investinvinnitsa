class CreateProjectImages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_images do |t|
      t.string :image
      t.string :locale
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
