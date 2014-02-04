class AddUserIdToPeopleAndOthers < ActiveRecord::Migration
  def self.up
    add_column :people, :user_id, :integer
    add_column :companies, :user_id, :integer
    add_column :events, :user_id, :integer
    add_column :jobs, :user_id, :integer
  end
  def self.down
    remove_column :people, :user_id
    remove_column :companies, :user_id
    remove_column :events, :user_id
    remove_column :jobs, :user_id
  end  
end
