class Customer::OrdersController < ApplicationController
  def index
    #@orders = current_customer.orders
    @orders = Customer.all
  end

  def new
    @order = Order.new
    @delivery_addresses = DeliveryAddress.where(customer: current_customer)
  end

  def create

  end

  def comfirm
    @order = Order.new(customer: current_customer)
    @order.payment_method = params[:order][:payment_method]
    # 上記２つは下記記述でもokay
    # @order = Order.new(customer: current_customer, payment_method: params[:order][:payment_method])

    # @order.address = current_customer.address
    # @order.name    = current_customer.last_name + current_customer.first_name
    # @order.postal_code = current_customer.postal_code

    # 空のインスタンスを作成
    # @order.address = current_customer.address
    if params[:order][:selected_address] == "1"
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:selected_address] == "2"
      address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.address     = address.address
      @order.postal_code = address.postal_code
      @order.name        = address.name

    elsif params[:order][:selected_address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]


    end

    # @order = Order.find(params[:order_id])
    # @address = @order.address.new(order_params)

    # @order.postal_code = current_customer.postal_code
    # @order.address     = current_customer.address
    # @order.name        =
  end

  def show
  end

  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method ,:selected_address, :delivery_address_id)
  end


end
