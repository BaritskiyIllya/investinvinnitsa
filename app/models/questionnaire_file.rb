class QuestionnaireFile < ApplicationRecord
  mount_uploader :file, QuestionnaireFileUploader
  include RelationLogging

  belongs_to :fileable, polymorphic: true

  def relation_able
    fileable
  end
end
