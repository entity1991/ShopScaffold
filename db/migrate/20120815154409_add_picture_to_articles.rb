class AddPictureToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :picture_data, :binary, limit: 10.megabytes
  end
end
