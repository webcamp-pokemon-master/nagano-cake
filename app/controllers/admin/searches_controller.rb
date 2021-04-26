class Admin::SearchesController < ApplicationController


  def search
  	@range = params[:range]
		@content = params[:content]
		if @range == "会員"
			@customers = Customer.search_for(@content).page(params[:page]).per(10)
		else
			@products = Product.search_for(@content).page(params[:page]).per(10)
		end
  end
end
