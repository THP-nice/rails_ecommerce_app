module CurrentCart

  private

  def set_cart
    unless curren_user == nil
      @cart = curren_user.cart || curren_user.create_cart
      session[:cart_id] = @cart.id
    end
  end

end
