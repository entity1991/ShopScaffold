class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belongs_to :article
  belongs_to :cart
end
