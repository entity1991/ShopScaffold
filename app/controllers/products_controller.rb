class ProductsController < ApplicationController
  before_filter :is_admin?

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product  = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product created!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, :notice => 'Product was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to :back
  end

end
