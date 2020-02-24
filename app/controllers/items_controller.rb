class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images)
    @search_params = item_search_params
    @items_search = Item.search(@search_params) 
    #検索結果を@items_searchに代入
  end

  def new
    @item = Item.new
    # @category_parent_array = ["---"]
    
    
    # @item.images.new
    @parents = Category.where(ancestry: nil)
    # .each do |parent|
      # @category_parent_array << parent.name
    
    # end
  end

  def show
    @item = Item.find(params[:id])
  end

  #editメソッド未完成
  def edit
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def category
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    else
      @s_cat = Category.find(params[:m_cat]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  # def get_category_children
  #   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  # end

  # def get_category_grandchildren
  #   @category_grandchildren = Category.find("#{params[:child_id]}").children
  # end
  
  def get_delivery_method
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
