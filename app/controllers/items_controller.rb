class ItemsController < RestrictedAccessController
  before_filter :load_tags, :only => [:index, :tags]
  
  def index
    @items = Item.all.sort(:created_at => 1)
  end
  
  def new
    @item = Item.new
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    respond_to do |format|
      @item = Item.find(params[:id])
      @item.update_attributes(params[:item])
      @item.add_rating(params[:rating], current_user._id) if params[:ratings]
      format.html do
        redirect_to root_path
      end
      format.js do
        head :ok
      end
    end
  end
  
  def create
    @item = Item.new(params[:item])
    @item.user = current_user
    @item.save!
    redirect_to root_path
  end
    
end