class UserFeedback < ActiveRecord::Base
  attr_accessible :user_name, :is_completed, :report_id
  
  belongs_to :report
end
