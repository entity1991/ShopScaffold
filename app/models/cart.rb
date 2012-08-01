class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
end
# == Schema Information
#
# Table name: carts
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

