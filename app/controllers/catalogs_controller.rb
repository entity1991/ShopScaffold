class CatalogsController < ApplicationController

  before_filter :categories

  def index
    @products = Product.paginate_with_conditions
    if params[:category]
      category = Category.find(params[:category])
      @products = Product.paginate_with_conditions 10, 1, ['category_id like ?', "%#{category.id}%"]
    end
    if params[:search]
      @products = Product.paginate_with_conditions 10, 1, ["title LIKE ? or description LIKE ?", "%#{params[:search_value]}%", "%#{params[:search_value]}%"]
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