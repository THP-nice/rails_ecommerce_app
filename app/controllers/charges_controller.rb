class ChargesController < ApplicationController

  def new
  end

  def create
<<<<<<< HEAD
    # Amount in cents
    @amount = @cart.total_price * 100
=======
    @line_item = current_user.cart
    @amount = (@line_item.total_price)*100
>>>>>>> developpment

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    flash[:notice] = "Your money is my money"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
