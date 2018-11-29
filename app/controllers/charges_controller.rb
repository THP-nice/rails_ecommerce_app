class ChargesController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:user])
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
      :currency    => 'usd'
    )

    UserMailer.welcome_email(@user).deliver_now
    @cart = current_user.cart
    @cart.destroy
    flash[:notice] = "Your money is my money"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
