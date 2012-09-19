class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[:item])
    @item.save!
    redirect_to root_path
  end
  
end