class AddFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flag, :integer, :default => 1
  end
end
