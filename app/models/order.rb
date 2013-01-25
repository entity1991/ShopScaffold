class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy

  attr_accessible :address, :email, :name

  validates :name, :address, :email, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      self.line_items << item
    end
  end

end

