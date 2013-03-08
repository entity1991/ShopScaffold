class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to :back }
        format.js {  @current_item = @line_item}
      else
        render :new
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to :back
  end

end
