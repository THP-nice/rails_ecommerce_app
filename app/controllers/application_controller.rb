class ApplicationController < ActionController::Base
  #truc de sécurité contre les hackeurs
  protect_from_forgery
  include CurrentCart
  before_action :set_cart

end
