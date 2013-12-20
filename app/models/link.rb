class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id
  validates :title, :url, :presence => true

  has_many(:link_subs)
  has_many(:subs, :through => :link_subs)
  belongs_to(:user)
end
