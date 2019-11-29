class ImageUploader < MainUploader
  include CarrierWave::MiniMagick

  process resize_to_limit: [1920, 1920]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
