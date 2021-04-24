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
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: "変更保存しました"
    else
      @genre_id = Genre.all
      redirect_to edit_admin_product(@product)
    end
  end

  def create
    @product = Product.new(product_params)
    @genres = Genre.all
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end



end
