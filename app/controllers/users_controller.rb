class UsersController < ApplicationController

  def index
    @products = current_user.products
    # user = User.find(params[:id])
    # user = User.includes(:products)
    # @products = Product.find(params[:id])
    # @nickname = user.nickname
  end
  
  def new
    @product = Product.new
    @images = @product.images.build
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def show
    @products = current_user.products
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  
  end  
  

end
