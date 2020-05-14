class UsersController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
    
  end
  
  def new
    @product = Product.new
    @images = @product.images.build
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def show
    @products = Product.includes(:images).order('created_at DESC')
  end
  
  def edit
    
  end
  
  

end
