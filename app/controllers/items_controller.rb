class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @search_params = item_search_params #
    @items_search = Item.search(@search_params) #検索結果を@items_searchに代入
  end

  def new
    @category_parent_array = ["---"]
    @item = Item.new
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:level1_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:level2_id]}").children
  end

  def create
    @item = Item.new(item_params)
    @item.save
    render :index
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :delivery_charge_id, :delivery_way_id, :prefecture_id, :price)
  end

  def item_search_params
    params.fetch(:search, {}).permit(:name, :keyword) 
    # fetchメソッド: paramsが空だったら{}を返す。 それ以外はparams[:name]を返す。
  end

end
