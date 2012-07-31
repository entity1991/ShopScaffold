module UsersHelper

  def users
    @users = User.all
  end
end
