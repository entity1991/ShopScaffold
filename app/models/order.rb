class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]
  attr_accessible :address, :email, :name, :pay_type

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      self.line_items << item
    end
  end
end
# == Schema Information
#
# Table name: orders
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

