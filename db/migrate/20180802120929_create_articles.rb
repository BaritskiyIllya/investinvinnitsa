class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.datetime :publication_time
      t.datetime :end_publication_time
      t.boolean :published, default: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Article.create_translation_table! title: :string, short_description: :string, description: :string
      end

      dir.down do
        Article.drop_translation_table!
      end
    end
  end
end
