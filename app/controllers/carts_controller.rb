class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_path, notice: 'Invalid cart'
    else
    end
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(params[:cart])
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to store_path, notice: 'Your cart is currently empty'
  end

end
