class Customer::CustomersController < ApplicationController
before_action :ensure_correct_customer, {only: [:show, :edit]}

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render 'edit'
    end
  end

  def quit
  end

  def out
   @customer = current_customer
   @customer.update(user_status: true)
    reset_session
    redirect_to root_path
  end



  private
  def customer_params
  	  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :postal_code, :address, :phone_number, :user_status, :user_password)
  end
  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
       redirect_to root_path
    end
  end


end
