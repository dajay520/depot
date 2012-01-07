class Product < ActiveRecord::Base
  default_scope :order => 'title'
  
  validates_presence_of :title,:description, :image_url
  validates_numericality_of :price
  
  
  
end
