class Feedback < ActiveRecord::Base
  attr_accessible :content, :address
  validates_presence_of :content, :address
end