class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :tagged?, :search?
  
  def tagged?
    params[:controller]=='tags' and  !params[:id].blank?
  end
  
  def search?
    !params[:query].blank?
  end
  
  protected
  
  def load_tags
    @tags = Item.all_tags.map{|t| t[:name] } rescue []
  end
  
  def load_stream
    @activities = Activity.all.limit(10)
  end
  
end
