module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("templatemo_logo.png", :alt => "Logo")
  end

  def rails
    image_tag("rails.png", :alt => "ava")
  end

  def search_form_action
    params[:controller] == "users" ? users_path : store_path
  end

  def search_form_label
    params[:controller] == "users" ? "users" : "articles"
  end

end
