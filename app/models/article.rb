class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :filler_id, :name, :price
  validates :name, :presence => true, :length => { :maximum => 50 }
end