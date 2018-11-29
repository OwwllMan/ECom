class OrderItemsController < ApplicationController

  def create
  	puts "coucou"
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end