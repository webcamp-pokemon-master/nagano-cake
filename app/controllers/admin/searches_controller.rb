class Admin::SearchesController < ApplicationController


  def search
  	@range = params[:range]
		@content = params[:content]
		# if @range == "会員"
			@customers = Customer.search_for(@content)
		# else
			@products = Product.search_for(@content)
		# end
  end
end
