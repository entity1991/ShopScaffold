class CreateFeedback < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.text :content
      t.timestamps
    end
  end

  def down
    drop_table :feedbacks
  end
end
