class Customer::OrdersController < ApplicationController
  def index
    #@orders = current_customer.orders
    @orders = Customer.all
  end

  def new
    @order = Order.new
    @delivery_addresses = DeliveryAddress.where(customer: current_customer)
  end


  def comfirm
    @cart_items = current_customer.cart_items.all
    @ordersnew = Order.new
    @order = Order.new(customer: current_customer)
    # 空のインスタンスを生成し、customerカラムにcurrento_customerを入れている
    @order.payment_method = params[:order][:payment_method]
    # 上記２つは下記記述でもokay
    # @order = Order.new(customer: current_customer, payment_method: params[:order][:payment_method])
    if params[:order][:selected_address] == "1"
      # "1"はviewでは整数で情報を送っているが、urlで情報を送る際に全て文字になるためここでは""をつける。
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

    @sum = 0
    @cart_items.each do |cart_item|
      @subtotal = (Product.find(cart_item.product_id).price * 1.1 * cart_item.amount).to_i
      @sum += @subtotal
    end
  end

  def create
    @order = current_customer.orders.new(name: params[:order][:name],
                                         address: params[:order][:address],
                                         postal_code: params[:order][:postal_code],
                                         payment_method: params[:order][:payment_method],
                                         payment: params[:order][:payment]
                                         )
    @order.save

    @cart_items = current_customer.cart_items.all
    # カートアイテムをorder_productsテーブルに保存
    @cart_items.each do |cart_item|
      OrderProduct.create(
        product_id: cart_item.product
        order_id: @order.id,
        amount: cart_item.amount,
        price: cart_item.product.price
        )
    end
    @cart_items.destroy_all
    redirect_to root_path
  end


  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @cart_items = current_customer.cart_items.all
    @sum = 0
    @cart_items.each do |cart_item|
    @subtotal = (Product.find(cart_item.product_id).price * 1.1 * cart_item.amount).to_i
    @sum += @subtotal
    end

  end

  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method, :payment, :selected_address, :delivery_address_id)
  end


end
