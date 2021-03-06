class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items

  attr_accessible :description, :title, :price, :category_id, :image, :archived

  has_attached_file :image, :styles => {:small => "100x100>", :medium => "250x250>" },
                            :url  => "/product_images/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/product_images/:id/:style/:basename.:extension"

  validates :title,       :presence => true, :length => { :maximum => 30 }
  validates :description, :presence => true
  validates :price,       :presence => true, :numericality => {greater_than_or_equal_to: 0.01}

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 10.megabytes
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/png image/jpg image/gif)

  default_scope :order => 'created_at DESC'

  def self.paginate_with_conditions(per_page=10, page=1, conditions=nil)
    paginate :per_page => per_page, :page => page, :conditions => conditions
  end

  def exist_in_order?
    not LineItem.where(:product_id => id).nil?
  end

end
