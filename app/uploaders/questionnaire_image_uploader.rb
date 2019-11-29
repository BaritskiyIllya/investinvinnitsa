class QuestionnaireImageUploader < ImageUploader
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.imgable_type.underscore}/#{model.imgable_id}"
  end
end
