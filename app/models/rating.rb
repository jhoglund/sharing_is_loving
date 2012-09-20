class Rating
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :item
  belongs_to :user
  
  field :value, :type => Integer
  
end