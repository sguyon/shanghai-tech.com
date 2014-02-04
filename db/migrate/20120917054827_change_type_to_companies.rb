class ChangeTypeToCompanies < ActiveRecord::Migration
  def up
  	remove_column :companies, :test
  	add_column :companies, :company_type, :string
  end

  def down
  	add_column :companies, :type, :string
  	remove_column :companies, :company_type
  end
end
