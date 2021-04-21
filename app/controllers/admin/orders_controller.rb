class Admin::OrdersController < ApplicationController


  def index  #注文履歴一覧
    if params[:customer_id]
      @orders = Customer.find(params[:customer_id]).orders
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end


  def show　#注文履歴詳細
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code, :postage, :payment, :payment_method, :status)
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :order_id, :amount, :making_status, :price)
  end

end
