class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :cart

  protect_from_forgery

  include ApplicationHelper
  include SessionsHelper

  private

  def cart
    @cart = current_cart
  end

  def current_cart
    (signed_in? && current_user.cart != nil) ? current_user.cart : Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  protected

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
