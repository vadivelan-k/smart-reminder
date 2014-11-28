class Reminder < ActiveRecord::Base
  attr_accessible :description, :event_time
  
  has_one :report
end
