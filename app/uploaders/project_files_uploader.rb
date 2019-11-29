class ProjectFilesUploader < FilesUploader
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.fileable_type.underscore}/#{model.fileable_id}/#{model.locale}"
  end
end
