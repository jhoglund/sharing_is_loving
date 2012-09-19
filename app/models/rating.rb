class Rating
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :item
  
  field :value, :type => Integer
  
end