class ArticlesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def index
    @articles = Article.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @article = Article.find(params[:id], :select => "*")
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

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, :notice => 'Article was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article.destroy
    redirect_back_or root_path
  end

  def picture
    @article = Article.find(params[:id])
    send_data(@article.picture_data, disposition: "inline")
  end

  private

  def authorized_user
    @article = current_user.articles.find_by_id(params[:id])
    redirect_to root_path if @article.nil?
  end
end
