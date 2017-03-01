class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path "noavatar.png"
  end

  version :medium do
    process resize_to_fill: [200, 200]
  end

  version :small, from_version: :medium do
    process resize_to_fill: [32, 32]
  end
end
