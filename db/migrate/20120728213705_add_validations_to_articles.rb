class AddValidationsToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :price, :decimal, precision: 8, scale: 2, default: 0
  end
end
