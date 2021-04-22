class Admin::OrderProductsController < ApplicationController
  def update
  @order_product = OrderProduct.find(params[:id])
  order_product.update(order_product_params)
  redirect_to admin_order_path(oeder_product.order)
  end

  private
  def order_product_params
    params.require(:order_item).permit(:making_status)
  end

end
