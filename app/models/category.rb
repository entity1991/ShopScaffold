class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :products

  validates_presence_of :name
  validates :name, :length => { :maximum => 25 }

end

