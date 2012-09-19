class ItemsController < ApplicationController
  before_filter :load_tags, :only => [:index, :tags]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    # params[:item]
    @item = Item.new(:name => 'test', :tag_list => 'xxx,aaa')
    @item.save!
    redirect_to root_path
  end
  
end