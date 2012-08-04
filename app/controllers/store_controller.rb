class StoreController < ApplicationController
  def index
    if params[:set_locale]
      redirect_to users_path(locale: params[:set_locale])
    else
      @articles = Article.order(:title)
      @cart = current_cart
    end
  end
end
