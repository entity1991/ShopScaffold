class CatalogsController < ApplicationController

  before_filter :categories

  def index
    @products = Product.paginate :per_page => 10, :page => (params[:page] or 1)
    if params[:category]
      category = Category.find(params[:category])
      @products = Product.paginate :per_page => 10, :page => (params[:page] or 1), :conditions => ['category_id like ?', "%#{category.id}%"]
    end
    if params[:search]
      @products = Product.paginate :per_page => 10, :page => (params[:page] or 1), :conditions => ["title LIKE ? or description LIKE ?", "%#{params[:search_value]}%", "%#{params[:search_value]}%"]
    end
  end

  def show
    @product = Product.find params[:id]
  end

  private

  def categories
    @categories = Category.all
  end

end