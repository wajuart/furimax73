class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create, :show, :get_category_children, :get_category_grandchildren, :search]
  before_action :set_card, only: [:purchase, :pay, :done]


  def index
    @products = Product.includes(:images).order('created_at DESC').limit(3)
    @products2 = Product.includes(:images).order('created_at ASC').limit(3)
  end


  def new
    @product = Product.new
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
      render :create
    else
      @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
      render :new
    end
  end

  def edit
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")

    grandchild_category = @product.category
    child_category = grandchild_category.parent

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")

      grandchild_category = @product.category
      child_category = grandchild_category.parent
  
      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
        @category_children_array << children
      end
  
      @category_grandchildren_array = []
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to product_path(@product.id)
    end
  end

  def search
    @products = Product.search(params[:keyword])
  end

  def purchase
    if @card.blank?
      flash.now[:alert] = 'カードを登録してください。'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    if @product.update( buyer_id: current_user.id)
      redirect_to done_products_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def done
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :size_id, :shippingcost_id, :shippingdays_id, :prefecture_id, :category_id, :brand_id, :shipping_id, :buyer_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end
