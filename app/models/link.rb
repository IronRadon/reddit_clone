class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url
  validates :title, :url, :presence => true
end
