class Customer::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "You have updated customer successfully."
    else
      render 'edit'
    end
  end

  def quit
  end
  
  def out 
  end 



  private
  def customer_params
  	  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :postal_code, :address, :phone_number, :user_status, :user_password)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to user_path(current_customer)
    end
  end
end
