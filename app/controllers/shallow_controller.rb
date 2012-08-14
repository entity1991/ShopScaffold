class ShallowController < ApplicationController

  def change_locale
    redirect_to root_path locale: params[:set_locale]
  end

  def search
    render "users/index"
  end
end