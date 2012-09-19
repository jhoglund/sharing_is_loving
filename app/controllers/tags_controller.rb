class TagsController < RestrictedAccessController
  before_filter :load_tags
  
  def show
    @items = Item.tagged_with(params[:id])
    render :template => '/items/index'
  end
  
end