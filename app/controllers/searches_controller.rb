class SearchesController < RestrictedAccessController
  before_filter :load_tags
  
  def show
    @items = Item.full_text_search(params[:query])
    flash.now[:error] = "We're sorry but we could'nd find anything matching \"#{params[:query]}\". Try with a new search query or <a href='/'>view all</a> documents.".html_safe if @items.empty?
    render :template => '/items/index'
  end
  
end