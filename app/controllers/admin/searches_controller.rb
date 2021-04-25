class Admin::SerchesController < ApplicationController


  def search
  	@range = params[:range]
		@content = params[:content]
		if @model == "会員"
			@records = Customer.search_for(@content)
		else
			@records = Product.search_for(@content)
		end
  end
end
