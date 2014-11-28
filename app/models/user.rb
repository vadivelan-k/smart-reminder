class User < ActiveRecord::Base
  attr_accessible :name, :email, :mobile_number
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :mobile_number, :presence => true, :length => 10..10
end
