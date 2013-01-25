class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :article_id
  belongs_to :article
  belongs_to :cart
  belongs_to :order

  def total_price
    self.article.price * self.quantity
  end

end


