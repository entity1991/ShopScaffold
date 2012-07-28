class PagesController < ApplicationController
  def home
    if signed_in?
      @article = Article.new
    end
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
