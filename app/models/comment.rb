class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :item
  belongs_to :user
  
  field :body
  
end