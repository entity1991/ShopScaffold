class RmFillerAndAddUserId < ActiveRecord::Migration
  def change
    rename_column :articles, :filler_id, :user_id
  end
end
