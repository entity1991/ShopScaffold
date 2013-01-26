class RefactoringOldDbStructure < ActiveRecord::Migration

  def change
    remove_column :carts,     :user_id
    remove_column :orders,    :pay_type
    remove_column :products,  :user_id
    remove_column :products,  :picture_data
    remove_column :users,     :role

    add_column :orders, :phone, :string
  end

end
