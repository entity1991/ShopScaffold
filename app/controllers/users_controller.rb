class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :boss_user,   :only => [:destroy, :change_role]
  before_filter :access_for_create_user,       :only => [:new, :create]

  def index
    @title = "All users"
    @users = User.paginate( page: params[:page], order: 'name', per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Shop!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @users = User.all
    flash[:success] = "User destroyed."
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js {
        render :js => "j('#user_list ##{ @user.id}').remove(); j('#users_count').html('Users (#{@users.count})');"
      }
    end
  end

  def change_role
    user = User.find params[:user][:id]
    user.update_attribute :role, params[:user][:role]
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js { }
    end
  end

  private

  def access_for_create_user
     if signed_in?
       redirect_back_or root_path
     end
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) || current_user.boss?
      redirect_to(root_path)
    end
  end

  def boss_user
    redirect_to(root_path) unless current_user.boss?
  end
end
