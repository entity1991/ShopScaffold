class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    self.product.price * self.quantity
  end

  def title
    product.title
  end

  def price
    product.price
  end

  def description
    product.description
  end

  def image
    product.image
  end

end


