class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  process :resize_to_fill => [80, 80]
  
end
