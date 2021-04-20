class Admin::OrdersController < ApplicationController


  def show　#注文履歴詳細
  end

  def index  #注文履歴一覧
    @customers = Customer.all
  end


end
