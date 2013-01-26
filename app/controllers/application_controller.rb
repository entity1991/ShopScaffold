class ApplicationController < ActionController::Base

  before_filter :set_i18n_locale_from_session,  :cart, :render_sidebar

  protect_from_forgery

  include ApplicationHelper
  include SessionsHelper

  private

  def cart
    @cart = current_cart
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  private

  def is_admin?
    redirect_to root_path, notice: t('you_do_not_have_a permission_to_this_page') unless signed_in?
  end

  def render_sidebar
    @render_sidebar = true
  end

  protected

  def set_i18n_locale_from_session
    if session[:locale]
      if I18n.available_locales.include?(session[:locale].to_sym)
        I18n.locale = session[:locale]
      else
        flash.now[:notice] = session[:locale] + " translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

end
