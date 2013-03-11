class AddAddressToFeedbacks < ActiveRecord::Migration
  def up
    add_column :feedbacks, :address, :string
  end

  def down
    remove_column :feedbacks, :address
  end
end
