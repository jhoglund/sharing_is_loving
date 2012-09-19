class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def load_tags
    @tags = Item.all_tags.map{|t| t[:name] }
  end
  
end
