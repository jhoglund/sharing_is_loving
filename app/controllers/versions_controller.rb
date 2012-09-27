class VersionsController < RestrictedAccessController
  
  def show
    @item = Item.find(params[:item_id])
    @version = @item.versions.where(:version => params[:id]).first
  end
  
  def rollback
    @item = Item.find(params[:item_id])
    @item.rollback!(params[:id])
    redirect_to @item
  end
  
end