class MapIconUploader < ImageUploader
  include CarrierWave::RMagick
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :init_geometry

  def valid_size?
    width = height = 32

    if @geometry.present?
      width = @geometry[0]
      height = @geometry[1]
    end

    width <= 32 && height <= 32
  end

  def init_geometry
    if @file
      img = ::Magick::Image.read(@file.file).first
      @geometry = [img.columns, img.rows]
    end
  end

  def extension_whitelist
    %w[jpg jpeg gif png svg]
  end
end
