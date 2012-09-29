class UploadsController < RestrictedAccessController
  
  def new
    @item = Item.new
  end
  
  def create
    files do |item|
      @item = item
      respond_to do |format|
        if @item.save
          format.html {
            render :json => [@item.to_jq_upload].to_json,
            :content_type => 'text/html',
            :layout => false
          }
          format.json { render json: [@item.to_jq_upload].to_json, status: :created, location: @item }
        else
          format.html { render action: "new" }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  protected
  
  def files
    params[:item][:file].each do |file|
      yield Item.new(:file => file, :name => (params[:item][:name] || to_name(file.original_filename)), :description => params[:item][:description], :tag_list => params[:item][:tag_list], :user => current_user)
    end
  end

  def to_name filename
    File.basename(filename, File.extname(filename)).tableize.humanize
  end
  
end