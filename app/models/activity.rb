class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :item
  belongs_to :user
  
  field :type, :default => 'updated'
  
end