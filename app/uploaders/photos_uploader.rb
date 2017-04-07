class PhotosUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [800, 600]
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [400, 300]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
