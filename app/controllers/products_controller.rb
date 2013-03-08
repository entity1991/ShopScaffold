class ProductsController < ApplicationController

  before_filter :is_admin?

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find params[:id]
    @categories = Category.all
  end

  def create
    @product  = Product.new params[:product]
    if @product.save
      flash[:success] = t('product_created')
      redirect_to products_path
    else
      @categories = Category.all
      render :new
    end
  end

  def update
    @product = Product.find params[:id]
    if @product.update_attributes(params[:product])
      redirect_to products_path, :notice => t('product_updated')
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.exist_in_order? ? @product.update_attribute(:archived, true) : @product.destroy
    redirect_to :back
  end

end
