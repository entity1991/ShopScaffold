class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    current_item ? current_item.quantity += 1 : current_item = line_items.build(product_id: product_id)
    current_item
  end

  def total_price
    self.line_items.to_a.sum{|item| item.total_price}
  end

  def total_quantity
    self.line_items.to_a.sum{|item| item.quantity}
  end

  def empty?
    self.line_items.count == 0
  end

end


