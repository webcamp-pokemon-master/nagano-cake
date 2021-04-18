class Customer::ProductsController < ApplicationController


  def index
    @products = Product.all.page(params[:page]).per(10)
    #@items = Item.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end
end
