class Report < ActiveRecord::Base
  attr_accessible :reminder_id
  
  has_many :user_feedbacks
  belongs_to :reminder
end
