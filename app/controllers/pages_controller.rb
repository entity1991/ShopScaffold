class PagesController < ApplicationController

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

  def send_secret_file
    send_data("/public/rails", disposition: "inline", file_name: "sdf")
  end

end
