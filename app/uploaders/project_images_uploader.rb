class ProjectImagesUploader < ImageUploader
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.imageable_type.underscore}/#{model.imageable_id}/#{model.locale}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
