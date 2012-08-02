class StoreController < ApplicationController
  def index
    @articles = Article.order(:title)
    @cart = current_cart
  end
end
