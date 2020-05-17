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

  def create
    User.create(user_params)
    # @user = User.new(user_params)
  end  

  def show
    @products = current_user.products
    # @products2 = user.products
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    # binding.pry
    @user = User.find(params[:id])
    if current_user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end


  private
  
  def user_params
    params.require(:user).permit(:user_image, :nickname, :introduction)
  end


end
