class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_fill: [600, 600]
  end

  version :small, from_version: :medium do
    process resize_to_fill: [20, 20]
  end

end
