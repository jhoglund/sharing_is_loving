class CommentsController < RestrictedAccessController
  
  def create
    respond_to do |format|
      @item = Item.find(params[:id])
      format.html do
        @comment = @item.comments.create(:body => params[:comment][:body], :user => current_user)
        render :partial => '/comments/comment', :layout => false, :object => @comment
      end
    end
  end
    
end