class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :article_id
  belongs_to :article
  belongs_to :cart
  belongs_to :order

  def total_price
    self.article.price * self.quantity
  end
end
# == Schema Information
#
# Table name: line_items
#
#  id         :integer(4)      not null, primary key
#  article_id :integer(4)
#  cart_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

