class Product < ActiveRecord::Base
  default_scope :order => 'title'
  
  validates_presence_of :title,:description, :image_url
  validates_numericality_of :price
  validates_length_of :title, :within => 10..100, :on => :create, :message => "must be present"
  
  
  
end
