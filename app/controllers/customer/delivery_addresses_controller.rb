class Customer::DeliveryAddressesController < ApplicationController
  def index
    @delivery_addresses = current_customer.delivery_addresses
    @delivery_address = DeliveryAddress.new
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
	  @delivery_address.customer_id = current_customer.id
    @delivery_addresses = current_customer.delivery_addresses
	  if @delivery_address.save
	    redirect_to delivery_addresses_path
	  else  @delivery_addresses = current_customer.delivery_addresses
	    render 'index'
	  end
  end
  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
	  if @delivery_address.update(delivery_address_params)
     redirect_to delivery_addresses_path
	  else
	   render "edit"
	  end
  end
  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to delivery_addresses_path
  end

  def delivery_address_params
  	params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
