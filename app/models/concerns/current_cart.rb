module CurrentCart

  private

  def set_cart
    @cart = current_user.carts.find_by(id: session[:cart_id]) || current_user.carts.create
    session[:cart_id] = @cart.id

    #@cart = Cart.find(session[:cart_id])
  #rescue ActiveRecord::RecordNotFound
    #@cart = Cart.create
    #session[:cart_id] = @cart.id
  end

end
