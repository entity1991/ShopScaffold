class RenameArticlesToProducts < ActiveRecord::Migration
  def up
    rename_table :articles, :products
  end

  def down
    rename_table :products, :articles
  end
end
