class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create, :show, :get_category_children, :get_category_grandchildren, :search]

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(3)
  end

  def new
    @product = Product.new
    @images = @product.images.build
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  def search
    @products = Product.search(params[:keyword])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :size_id, :shippingcost_id, :shippingdays_id, :prefecture_id, :category_id, :brand_id, :shipping_id, :buyer_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
