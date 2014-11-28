class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,                :null => false, :default => ''
      t.string    :mobile_number, :null => false
      t.string    :email,               :null => false
      
      t.timestamps
    end
  end
end
