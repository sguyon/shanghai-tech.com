class AddDefaultToRoles < ActiveRecord::Migration
  def up
      change_column :users, :roles, :integer, :default => false
  end

  def down
      change_column :users, :roles, :integer, :default => nil
  end
end