class CreateQuestionnaireFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaire_files do |t|
      t.string :file
      t.references :fileable, polymorphic: true
      t.timestamps
    end
  end
end
