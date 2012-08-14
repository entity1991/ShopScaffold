module UsersHelper

  def users
    @users = User.all
  end

  def some_users(field, value)
    User.where("#{field} = ?", value)
  end
end
