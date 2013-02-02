class CatalogsController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
    if params[:category]
      category = Category.find_all_by_name(params[:category]).first
      @products = Product.find_all_by_category_id category.id
    end
    if params[:search]
      @products = Product.where("title LIKE ? or description LIKE ?", "%#{params[:search_value]}%", "%#{params[:search_value]}%")
    end
  end

  def show
    @product = Product.find params[:id]
  end

end