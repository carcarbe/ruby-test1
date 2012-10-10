class Project < ActiveRecord::Base
  attr_accessible :name, :order, :section_id 
 
  has_many :contents ,:dependent => :destroy
  belongs_to :section
  
   validates_existence_of :section
end
