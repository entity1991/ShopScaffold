class AnyChangeInArticles < ActiveRecord::Migration
  def change
    change_column :articles, :description, :text
    rename_column :articles, :name, :title
  end
end
