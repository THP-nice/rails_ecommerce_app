class CartsController < ApplicationController
  include CurrentCart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :show]
  before_action :admin_user, only: [:index]

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Invalid cart #{params[:id]}"
      redirect_to root_path, notice: "Doesn't exist."
    end

    def admin_user
      redirect_to(root_path) unless current_user && current_user.admin?
      flash[:alert] = "Nope"
    end

end
