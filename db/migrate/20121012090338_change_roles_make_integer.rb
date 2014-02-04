class ChangeRolesMakeInteger < ActiveRecord::Migration
  def up
    remove_column :users, :roles
    add_column :users, :roles, :integer
  end

  def down
    remove_column :users, :roles
    add_column :users, :roles, :string    
  end
end