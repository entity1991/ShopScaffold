class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.integer :filler_id
      t.float :price

      t.timestamps
    end
  end
end
