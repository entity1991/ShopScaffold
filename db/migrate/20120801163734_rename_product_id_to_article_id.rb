class RenameProductIdToArticleId < ActiveRecord::Migration
  def change
    rename_column :line_items, :product_id, :article_id
  end
end
