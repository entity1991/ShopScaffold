class ChangeFlagToStringInUsers < ActiveRecord::Migration
  def change
    change_column :users, :flag, :string, :default => "Customer"
    rename_column :users, :flag, :role
  end
end
