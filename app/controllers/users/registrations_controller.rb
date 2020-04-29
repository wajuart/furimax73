# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    params[:user][:birth_day]
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @destination = @user.build_destination
    render :new_destination
  end

  def create_destination
    @user = User.new(session["devise.regist_data"]["user"])
    @destination = Destination.new(destination_params)
    unless @destination.valid?
      flash.now[:alert] = @destination.errors.full_messages
      render :new_destination and return
    end
    @user.build_destination(@destination.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def destination_params
    params.require(:destination).permit(:post_code, :address, :prefecture, :city, :building_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :phone_number)
  end
end
