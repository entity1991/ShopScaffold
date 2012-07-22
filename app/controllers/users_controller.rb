class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    @user = User.find(params[:id])

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
