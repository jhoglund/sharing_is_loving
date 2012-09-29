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
      @item.activity_by(current_user, :updated)
      @item.update_attributes(params[:item])
      format.html do
        redirect_to item_path(@item)
      end
    end
  end
  
  def like
    respond_to do |format|
      @item = Item.find(params[:id])
      @item.like(current_user._id)
      @item.versionless do |item|
        item.update_attributes(params[:item])
      end
      format.html do
        render :text => @item.rating_count
      end
    end
  end
  
  def create
    @item = Item.new(params[:item])
    @item.created_by = current_user
    @item.save!
    redirect_to root_path
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
    
end