class StoreController < ApplicationController
  def index
    @articles = Article.order(:title)
    @articles = @articles.where("title LIKE ? OR description LIKE ?", "%#{params[:search]}%",  "%#{params[:search]}%") if params[:search]
  end
end
