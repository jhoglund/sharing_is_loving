class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Document::Taggable
  #include Mongoid::Search
  
 # mount_uploader :file, FileUploader do
 #   def store_dir
 #     model.path
 #   end
 # end
 # 
 # mount_uploader :preview, PreviewUploader do
 #   def store_dir
 #     model.path('previews')
 #   end
 # end
 # 
 # search_in :name, :description, :taggings => :name
 # 
 # after_initialize :create_token
 # 
 # embeds_many :ratings

  field :name
  field :description
 # field :secure_token
 # 
 # accepts_nested_attributes_for :ratings
 # 
 # def path base='files'
 #   File.join(Rails.env, 'items', base, self.secure_token)
 # end
 #     
 # def create_token
 #   self.secure_token = self.secure_token || SecureRandom.uuid
 # end
 # 
 # class Tag
 #   attr_reader :name
 #   def initialize name=""
 #     @name = name
 #   end
 # end
 # 
 # def taggings
 #   self.tags.map{|n| Tag.new(n)}
 # end
  
end