# Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')
CarrierWave.configure do |config|
  #if Rails.env.development?
    config.fog_credentials = {
      :provider => 'Google',
      :google_storage_access_key_id => 'GOOGYHB4HOLTJYDC5I3O',
      :google_storage_secret_access_key => 'oUhoCj3fneWBQ/01n6OrWo2yIQt5l5xAkK5lmuQW'
    }
    config.fog_directory = 'fjord_sharing_is_loving'
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  #end
end
