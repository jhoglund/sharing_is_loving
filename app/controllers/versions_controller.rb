class VersionsController < RestrictedAccessController
  
  def show
    @item = Item.find(params[:item_id])
    @version = @item.versions.all[params[:id].to_i]
  end
  
end