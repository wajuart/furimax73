class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
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

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :size, :shipping_cost, :shipping_days, :prefecture_id, :judgment, :category_id, :brand_id, :shipping_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
