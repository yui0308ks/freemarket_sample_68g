class ItemsController < ApplicationController
  def index
    # @items = Items.all
    @search_params = item_search_params
    @items_search = Item.search(@search_params).includes(:prefecture)
  end

  def new
  end


  private

  def item_search_params
    params.fetch(:search, {}).permit(:name)
  end

end
