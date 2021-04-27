class Admin::ProductsController < ApplicationController

 before_action :authenticate_admin!, except: [:index,:show]

 add_flash_types :success #フラッシュメッセージのデザイン種類指示

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
      redirect_to admin_product_path(@product), success: "変更保存しました"
    else
      @genre_id = Genre.all
      redirect_to edit_admin_product(@product)
    end
  end

  def create
    @product = Product.new(product_params)
    @genres = Genre.all
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end



end
