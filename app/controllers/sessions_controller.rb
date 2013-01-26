class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create

    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash[:error] = "Invalid email/password combination."
      @title = "Sign in"
    else
      sign_in user
    end
    redirect_to :back
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def change_locale
    session[:locale] = params[:set_locale]
    redirect_to root_path
  end

  private

end
