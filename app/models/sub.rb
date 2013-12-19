class Sub < ActiveRecord::Base
  attr_accessible :description, :mod_id, :name
  validates :mod_id, :name, :description, :presence => true
  validates :name, :description, :uniqueness => true
  
  
end
