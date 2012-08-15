class OrdersController < ApplicationController

  # GET /orders
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /orders/new
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_path, notice: "Your cart is empty"
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        current_cart.destroy
        cart = Cart.new
        session[:cart_id] = cart.id
        OrderNotifier.received(@order).deliver
        format.html { redirect_to store_path, notice: 'Thank you for your order.' }
      else
        @cart = current_cart
        format.html { render action: "new" }
      end
    end
  end

  # PUT /orders/1
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
    end
  end
end
