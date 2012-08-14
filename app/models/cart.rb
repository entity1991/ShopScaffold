class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_article(article_id)
    current_item = line_items.find_by_article_id(article_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(article_id: article_id)
    end
    current_item
  end

  def total_price
    self.line_items.to_a.sum {|item| item.total_price}
  end
end
# == Schema Information
#
# Table name: carts
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

