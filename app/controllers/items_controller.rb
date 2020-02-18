class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.permit(:name, :description, :category, :condition, :size, :delivery_charge, :delivery_way, :prefecture)
  end
end
