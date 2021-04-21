class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(8)
    #アプリケーションを完成させよう2の4章参照
    #@items = Item.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :status, :image_id)
  end
end
