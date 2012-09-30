class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::Taggable
  include Mongoid::Search
  include Mongoid::Versioning
  
  mount_uploader :file, FileUploader do
    def store_dir
      model.path
    end
  end
  
  mount_uploader :preview, PreviewUploader do
    def store_dir
      model.path('previews')
    end
  end
  
  search_in :name, :description, :taggings => :name
  
  after_initialize :create_token
  
  embeds_many :ratings
  embeds_many :comments
  
  has_many :activities, autosave: true 
  def activity_by person, activity='updated'
    activities.build(:user => person, :type => activity.to_s)
  end
  
  belongs_to :user
  def created_by
    user
  end
  def created_by= person
    user= person
  end

  field :name
  field :description
  field :secure_token
  field :rating_count, :type => Integer, :default => 0
  
  default_scope desc(:rating_count).desc(:created_at)
  
  accepts_nested_attributes_for :ratings
  
  def path base='files'
    File.join(Rails.env, 'items', base, self.secure_token)
  end
      
  def create_token
    self.secure_token = self.secure_token || SecureRandom.uuid
  end
  
  def rollback! index
    self.versionless do
      self.revise!
      self.versions.where(:version => index).first.attributes.each do |key,value|
        self.write_attribute(key,value) unless key=='_id' || key=='version'
      end
      self.created_at = Time.now
      self.save
    end
  end
  
  class Tag
    attr_reader :name
    def initialize name=""
      @name = name
    end
  end
  
  def taggings
    self.tags.map{|n| Tag.new(n)}
  end
  
  def like user_id
    self.ratings.build(:value => 1, :user_id => user_id)
    self.rating_count = self.rating_count + 1
  end
  
  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => self.name,
      "filename" => self.file_filename,
      "description" => self.description,
      "tags" => self.tags,
      "tags_url" => tag_path(''),
      "size" => self.file.size,
      "url" => self.file.url,
      "delete_url" => item_path(self),
      "delete_type" => "DELETE" 
    }
  end

  
  
end