class Reminder < ActiveRecord::Base
  attr_accessible :description, :event_time
  
  has_one :report
  
  validates :description, :presence => true
  validates :event_time, :presence => true
end
