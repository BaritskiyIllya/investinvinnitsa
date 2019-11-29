class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :text
      t.string :link
      t.string :alt
      t.string :image

      t.timestamps
    end
  end
end
