class AddAdress2ToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :adress,  :string
  end
  def self.down
    remove_column :companies, :adress
  end  
end
