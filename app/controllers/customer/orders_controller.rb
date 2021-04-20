class Customer::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @delivery_addresses = DeliveryAddress.where(customer: current_customer)
  end

  def create

  end

  def comfirm
    
    @order = Order.new
    # 空のインスタンスを作成
    
    # @order.address = current_customer.address
    if params[:order][:selected_address] == 1
      
    elsif params[:order][:selected_address] == 2
      
    elsif params[:order][:selected_address] == 3

    # @order = Order.find(params[:order_id])
    # @address = @order.address.new(order_params)

    # @order.postal_code = current_customer.postal_code
    # @order.address     = current_customer.address
    # @order.name        = current_customer.last_name + current_customer.first_name
  end

  def show
  end

  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method ,:selected_address)
  end


end
