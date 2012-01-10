class Product < ActiveRecord::Base
  default_scope :order => 'title'
  
  validates_presence_of :title,:description, :image_url
  validates_numericality_of :price
  validates_length_of :title, :within => 10..100, :on => :create, :message => "must be present"
  
  has_many :line_items
  before_destroy  :ensure_not_referenced_by_any_line_item
  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base,'Line Items present')
      return false
      
    end
    
  end
  
  
end
