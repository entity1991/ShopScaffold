class CreateAdminUser < ActiveRecord::Migration
  def up
    User.create(password: "11111111", email: "admin@gmail.com")
  end

  def down
    @user = User.where(password: "11111111", email: "admin@gmail.com").first
    @user.destroy if @user
  end
end
