class CreateUserFeedbacks < ActiveRecord::Migration
  def change
    create_table :user_feedbacks do |t|
      t.integer :report_id
      t.string :user_name
      t.boolean :is_completed
      
      t.timestamps
    end
  end
end
