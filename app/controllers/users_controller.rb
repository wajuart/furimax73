class UsersController < ApplicationController

  def index
    @products = current_user.products
  end
  
  def show
    @products = current_user.products
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_image, :nickname, :introduction)
  end

end
