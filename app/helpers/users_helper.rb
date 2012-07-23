module UsersHelper

  def admin?
    current_user.flag == 2
  end
end
