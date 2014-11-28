class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.text    :description,  :null => false
      t.datetime  :event_time
      
      t.timestamps
    end
  end
end
