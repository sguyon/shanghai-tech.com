class AddAdressToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :latitude,  :float #you can change the name, see wiki
    add_column :companies, :longitude, :float #you can change the name, see wiki
    add_column :companies, :gmaps, :boolean #not mandatory, see wiki
  end
  def self.down
    remove_column :companies, :latitude
    remove_column :companies, :longitude
    remove_column :companies, :gmaps
  end  
end
