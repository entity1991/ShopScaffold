class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash[:error] = t('invalid_email_password_combination')
      @title = t('sign_in')
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
    redirect_to :back
  end

end
