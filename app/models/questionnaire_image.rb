class QuestionnaireImage < ApplicationRecord
  mount_uploader :image, QuestionnaireImageUploader
  include RelationLogging

  belongs_to :imgable, polymorphic: true

  def relation_able
    imgable
  end
end
