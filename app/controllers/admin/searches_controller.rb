class Admin::SearchesController < ApplicationController


  def search
		@content	 = params[:content]
		@customers = Customer.search_for(@content)
		@products  = Product.search_for(@content)
  end
end
