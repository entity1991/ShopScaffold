class RenameArticleIdToProductId < ActiveRecord::Migration
  def up
    rename_column :line_items, :article_id, :product_id
  end

  def down
    rename_column :line_items, :product_id, :article_id
  end
end
