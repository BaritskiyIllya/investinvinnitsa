class AddSliderTranslate < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Slider.create_translation_table!({ title: :string, text: :text, alt: :string, link: :string },
                                         { migrate_data: true, remove_source_columns: true })
        remove_column :sliders, :image
      end

      dir.down do
        Slider.drop_translation_table! migrate_data: true
        add_column :sliders, :image, :string
      end
    end
  end
end
