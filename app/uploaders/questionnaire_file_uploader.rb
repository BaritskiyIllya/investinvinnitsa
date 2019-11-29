class QuestionnaireFileUploader < MainUploader
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.fileable_type.underscore}/#{model.fileable_id}"
  end

  def extension_whitelist
    %w[pdf]
  end
end
