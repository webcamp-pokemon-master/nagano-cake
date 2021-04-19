class Customer::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @delivery_addresses = DeliveryAddress.where(customer: current_customer)

  end

  def comfirm
  end

  def show
  end

  def thanks
  end


  private
  def order_params
    params.require(:order).params(:name, :address, :postal_code, :payment_method)
  end


end
