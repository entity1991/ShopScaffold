class PagesController < ApplicationController

  before_filter :is_admin?, only: :admin_profile

  def home
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

  def admin_profile
    @render_sidebar = false
    @admin = current_user
    if params[:change_admin_profile]
      if @admin.update_attributes params[:user]
        redirect_to products_path, notice: t('settings_successfully_updated')
      else
        render 'admin_profile'
      end
    end
  end

end
