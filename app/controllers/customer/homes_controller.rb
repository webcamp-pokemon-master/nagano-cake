class Customer::HomesController < ApplicationController
  def top
     @newproducts = Product.all.order(created_at: :desc).limit(4)
  end

  def about
  end
end
