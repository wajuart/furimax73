class UsersController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @products = current_user.product
  end
  
  def new
    @product = Product.new
    @images = @product.images.build
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def show
    @products = current_user.product
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end  

end
