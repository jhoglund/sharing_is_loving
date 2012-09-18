class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :file, FileUploader do
    def store_dir
      File.join(Rails.env, 'items', model.secure_token)
    end
  end
  after_initialize :create_token

  field :name
  field :rating, :type => Integer
  field :description
  field :secure_token
  
  protected
  
  def create_token
    self.secure_token = self.secure_token || SecureRandom.uuid
  end
  
end