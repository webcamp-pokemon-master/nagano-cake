class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(10)
    #アプリケーションを完成させよう2の4章参照
    #@items = Item.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end



end
