class Customer::CartItemsController < ApplicationController


  def index

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
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
    params.require(:cart_item).permit(:customer_id, :product_id, :amount)
  end

end
