class Section < ActiveRecord::Base
  attr_accessible :name, :order
  
  has_many :projects ,:dependent => :destroy
end

