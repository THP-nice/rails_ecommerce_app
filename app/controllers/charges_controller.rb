class ChargesController < ApplicationController

  def new
  end

  def create
    @line_item = current_user.cart
    # Amount in cents
    @amount = (@line_item.total_price)*100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

    @cart = current_user.cart
    @cart.destroy
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
