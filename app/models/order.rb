class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy

  attr_accessible :address, :email, :name, :phone

  validates :name, :email, presence: true

  default_scope :order => "created_at desc"

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      self.line_items << item
    end
  end

end

