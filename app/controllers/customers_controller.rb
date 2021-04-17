class CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def quit
  end

  def out
  end

  def index
  end

   private
  def customer_params
  	  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :postal_code, :address, :phone_number, :user_status, :user_password)
  end

end
