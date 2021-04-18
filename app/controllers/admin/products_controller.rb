class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_homes_top_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre, :price, :status)
  end



end
