class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  
  def index
    @items = Item.includes(:images).order('created_at DESC')
    @search_params = item_search_params
    @items_search = Item.search(@search_params) 
    #検索結果を@items_searchに代入
  end
  
  def new
    @item = Item.new
<<<<<<< HEAD
    @item.images.new    
    @parents = Category.where(ancestry: nil)    
=======
    @item.images.new
    
    @parents = Category.where(ancestry: nil)
    # @parents = Parent.all
>>>>>>> master
  end
  
  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments
  end
  
  #editメソッド未完成
  def edit
    # @item = Item.find_by(id: params[:id])
    @item = Item.find(params[:id])
<<<<<<< HEAD
    @images = @item.images
    # @images = Image.find(item_id: params[:id])
    # no = @iem.cat~.id
=======
    # binding.pry
    @images = @item.images
>>>>>>> master
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
      render :edit
    end
  end
  
<<<<<<< HEAD
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
=======
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end 
>>>>>>> master

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

<<<<<<< HEAD
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
=======
 
>>>>>>> master
  def get_delivery
      respond_to do |format|
        format.html
        format.json
      end
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
        redirect_to root_path 
    else
      flash[:notice] = "必須項目を全て入力してください。"
      redirect_to new_item_path 
     
      # render :new
    end
  end

  private
  def item_params
<<<<<<< HEAD
    params.require(:item).permit(:name, :description, :category_id, :size, :delivery_charge_id, :delivery_way_id, :prefecture_id, :price, images_attributes: [:image, :_destroy, :id])
=======
    params.require(:item).permit(:name, :description, :category_id, :size, :delivery_charge_id, :delivery_way_id, :delivery_day_id,:prefecture_id, :price, :condition, images_attributes: [:image]).merge( user_id: current_user.id)
>>>>>>> master
  end

  def item_search_params
    params.fetch(:search, {}).permit(:name, :keyword) 
    # fetchメソッド: paramsが空だったら{}を返す。 それ以外はparams[:name]を返す。
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

  def set_item
    @item = Item.find(params[:id])
  end
