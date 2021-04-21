class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @sum = 0
    @cart_items.each do |cart_item|
      @subtotal = (Product.find(cart_item.product_id).price * 1.1 * cart_item.amount).to_i
      @sum += @subtotal
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.product_id == @cart_item.product_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    @cart_items = CartItem.all

    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :amount)
  end
end
