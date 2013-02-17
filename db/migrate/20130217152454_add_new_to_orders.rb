class AddNewToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :new, :boolean, :default => true
  end

  def down
    remove_column :orders, :new
  end
end
