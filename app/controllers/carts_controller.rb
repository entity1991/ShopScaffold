class CartsController < ApplicationController

  def show
    begin
      @cart = Cart.find(params[:id])
      @order = Order.new
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: 'Invalid cart'
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path, notice: t('your_cart_is_currently_empty')
  end

end
