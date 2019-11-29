class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.integer :video_position_id
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Video.create_translation_table! short_title: :string, title: :string, description: :string, link: :string
      end

      dir.down do
        Video.drop_translation_table!
      end
    end
  end
end
