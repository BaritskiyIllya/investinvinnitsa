class CreateArticlesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_tags, id: false do |t|
      t.references :article
      t.references :tag
    end
  end
end
