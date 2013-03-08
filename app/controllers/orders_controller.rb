class OrdersController < ApplicationController

  before_filter :is_admin?, :except => :create

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order.update_attribute(:new, false)
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      current_cart.destroy
      cart = Cart.new
      session[:cart_id] = cart.id
      redirect_to root_path, :notice => t('thank_you_for_your_order')
    else
      @cart = current_cart
      render 'carts/show'
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to :back
  end

end
