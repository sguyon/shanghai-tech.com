class AddDefaultToAdmin < ActiveRecord::Migration
  def up
      change_column :users, :admin, :integer, :default => false
  end

  def down
      change_column :users, :admin, :integer, :default => nil
  end
end