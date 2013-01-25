class ArticlesController < ApplicationController
  before_filter :is_admin?

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def create
    @article  = current_user.articles.build(params[:article])
    if @article.save
      flash[:success] = "Article created!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice => 'Article was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to :back
  end

end
