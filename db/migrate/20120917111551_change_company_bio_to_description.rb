class ChangeCompanyBioToDescription < ActiveRecord::Migration
  def up
  	remove_column :companies, :bio
  	add_column :companies, :description, :string

  end

  def down
  	remove_column :companies, :description
  	add_column :companies, :bio, :string  	
  end
end
