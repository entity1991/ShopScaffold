class CreateAdminUser < ActiveRecord::Migration
  def change
    User.create(name: "Admin", password: "11111111", email: "admin@gmail.com")
  end
end
