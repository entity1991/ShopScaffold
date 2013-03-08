class AddArchivedToProducts < ActiveRecord::Migration
  def up
    add_column :products, :archived, :boolean, :default => false
  end

  def down
    remove_column :products, :archived
  end
end
