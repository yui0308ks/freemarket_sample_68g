class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
    @search_params = item_search_params
    @items_search = Item.search(@search_params) 
    #検索結果を@items_searchに代入
  end

  def new
    @item = Item.new
    @item.images.new
    
    @parents = Category.where(ancestry: nil)
    # @parents = Parent.all
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
        redirect_to root_path 
    else
      flash[:notice] = "必須項目を全て入力してください。"
      redirect_to new_item_path 
    end
  end

  def show
    @category = @item.category
    @comment = Comment.new
    @comments = @item.comments  
  end

  def edit
    @item = Item.find(params[:id])
    @images = @item.images
    @parents = Category.where(ancestry: nil)
    @ground_child = Category.find(@item.category_id)
    @child = @ground_child.parent
    @parent = @child.parent
  end
  
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      flash[:notice] = "必須項目を全て入力してください。"
      redirect_to edit_item_path 
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path
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

 
  def get_delivery
      # respond_to do |format|
      #   format.html
      #   format.json
      # end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :delivery_charge_id, :delivery_way_id, :delivery_day_id,:prefecture_id, :price, :condition, images_attributes: [:image, :_destroy, :id]).merge( user_id: current_user.id)
  end

  def item_search_params
    params.fetch(:search, {}).permit(:name, :keyword) 
    # fetchメソッド: paramsが空だったら{}を返す。 それ以外はparams[:name]を返す。
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
