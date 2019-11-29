class CreateQuestionnaireImages < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaire_images do |t|
      t.string :image
      t.references :imgable, polymorphic: true
      t.timestamps
    end
  end
end
