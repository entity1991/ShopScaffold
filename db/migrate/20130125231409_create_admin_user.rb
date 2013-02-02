class CreateAdminUser < ActiveRecord::Migration
  def change
    User.create(password: "11111111", email: "admin@gmail.com")
  end
end
