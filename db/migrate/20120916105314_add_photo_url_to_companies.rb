class AddPhotoUrlToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :photo_url, :string
  end
end
