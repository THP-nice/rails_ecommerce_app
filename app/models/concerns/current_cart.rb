module CurrentCart

  private

  def current_cart
    unless current_user == nil
      @cart = current_user.cart || current_user.create_cart
      session[:cart_id] = @cart.id
    end
  end

end
