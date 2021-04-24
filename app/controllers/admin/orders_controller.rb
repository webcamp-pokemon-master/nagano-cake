class Admin::OrdersController < ApplicationController


  def index  #注文履歴一覧
    @orders = Order.all.page(params[:page]).per(10)
  end

  def one_index
    @orders = Order.where(customer_id:(params[:id]))
    render :index
  end

  def show
  @order = Order.find(params[:id])
  @order_products = @order.order_products
  
  end

  def update
		@order = Order.find(params[:id])
	  @order.update(order_params)
		redirect_to admin_order_path(@order)
  end



  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code, :postage, :payment, :payment_method, :status)
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :order_id, :amount, :making_status, :price)
  end

end
