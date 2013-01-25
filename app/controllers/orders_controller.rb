class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_path, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      current_cart.destroy
      cart = Cart.new
      session[:cart_id] = cart.id
      OrderNotifier.received(@order).deliver
      redirect_to store_path, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "new"
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url
  end

end
