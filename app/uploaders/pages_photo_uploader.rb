class PagesPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fill: [600, 800]
  # storage :file
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg png heic webp]
  end
end
