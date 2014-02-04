class AddRolesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :roles, :string
    remove_column :users, :role
  end
  def self.down
    remove_column :users, :roles
    add_column :users, :role, :string
  end  
end
