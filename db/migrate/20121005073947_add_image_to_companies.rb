class AddImageToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :image, :string
    remove_column :companies, :photo_url
  end
  def self.down
    add_column :companies, :image, :string
    remove_column :companies, :photo_url
  end
end