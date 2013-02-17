class CategoriesController < ApplicationController

  before_filter :is_admin?

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.save ? redirect_to(categories_path, notice: t('category_created')) : render(:new)
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category]) ?
        redirect_to(categories_path, notice: t('category_updated')) :
        render(:edit)
  end

  def destroy
    Category.find(params[:id]).destroy and redirect_to categories_path
  end

end