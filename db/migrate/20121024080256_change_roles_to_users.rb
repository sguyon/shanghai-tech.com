class ChangeRolesToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :roles
    add_column :users, :admin, :string
  end

  def down
    remove_column :users, :admin
    add_column :users, :roles, :string
  end
end