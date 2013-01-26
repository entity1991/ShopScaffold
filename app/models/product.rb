class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :is_line_items?

  attr_accessible :description, :title, :price, :category_id, :uploaded_picture

  validates :title,       :presence => true, :length => { :maximum => 30 }, :uniqueness => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :user_id,     :presence => true
  validates :price,       :presence => true, :numericality => {greater_than_or_equal_to: 0.01}

  default_scope :order => 'created_at DESC'

  def uploaded_picture=(picture_field)
    self.picture_data = picture_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end

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
