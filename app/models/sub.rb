class Sub < ActiveRecord::Base
  has_many(:link_subs)
  has_many(:links, :through => :link_subs)
  accepts_nested_attributes_for :links
  attr_accessible :description, :mod_id, :name, :links_attributes
  validates :mod_id, :name, :description, :presence => true
  validates :name, :description, :uniqueness => true

  belongs_to(:moderator,
             :class_name => 'User',
             :foreign_key => :mod_id,
             :primary_key => :id)
end
