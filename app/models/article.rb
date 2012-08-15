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
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :is_line_items?

  attr_accessible :description, :title, :price, :category_id

  validates :title, :presence => true, :length => { :maximum => 50 }, :uniqueness => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true
  validates :price, :presence => true, :numericality => {greater_than_or_equal_to: 0.01}

  default_scope :order => 'articles.created_at DESC'

  private

  # ensure that there are no line items referencing this product
  def is_line_items?
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end
end
