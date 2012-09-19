class PreviewUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  process :resize_to_fit => [600, 600]

  version :thumb do
    process :resize_to_fill => [100,100]
  end
  
end
