class Customer::CartItemsController < ApplicationController


  def index
  end

  def create
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :products_id, :amount)
  end

end
