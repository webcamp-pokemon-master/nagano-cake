class Admin::OrdersController < ApplicationController


  def index  #注文履歴一覧
    @customers = Customer.all
      if params[:customer_id]
        @customer = Customer.find(params[:customer_id])
        @orders = @customer.orders.page(params[:page]).reverse_order
      elsif params[:created_at] == "today"
        @orders = Order.ordered_today.includes(:customer).page(params[:page]).reverse_order
      else
      @customers = Customer.all   #ここだけ一時的にcustomer情報取得している状態　要変更
      end
  end

  # if params[:customer_id]
  #  @customer = Customer.find(params[:customer_id])
  #   @orders = @customer.orders.page(params[:page]).reverse_order
  #  elsif params[:created_at] == "today"
  #    @orders = Order.ordered_today.includes(:customer).page(params[:page]).reverse_order
  #  else
  #    @orders = Order.includes(:customer).page(params[:page]).reverse_order
  #  end


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
