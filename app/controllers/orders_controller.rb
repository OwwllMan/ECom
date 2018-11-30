class OrdersController < ApplicationController
  def create
  #STRIPE

  # Amount in cents
  @amount = 500
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  #CREATION ORDER
  @cart = Cart.all.where(user_id: current_user.id)
  for cart in @cart
    Order.create!(user_id: current_user.id, item_id: cart.item_id)
    Cart.find(cart.id).destroy
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to carts_url
  end
end
