# == Schema Information
#
# Table name: articles
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  price       :decimal(8, 2)   default(0.0)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :price

  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :user_id, :presence => true
  validates :price, :presence => true, numericality: true

  default_scope :order => 'articles.created_at DESC'
end
