class ItemsController < RestrictedAccessController
  before_filter :load_tags, :load_stream
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    respond_to do |format|
      @item = Item.find(params[:id])
      @item.created_by = current_user
      if params[:ratings]
        @item.add_rating(params[:rating], current_user._id)
        @item.versionless do |item|
          item.update_attributes(params[:item])
        end
      else
        @item.update_attributes(params[:item])
      end
      format.html do
        redirect_to item_path(@item)
      end
      format.js do
        head :ok
      end
    end
  end
  
  def create
    @item = Item.new(params[:item])
    @item.created_by = current_user
    @item.save!
    redirect_to root_path
  end
    
end