class AddWidthHeightToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :image_width, :integer
    add_column :companies, :image_height, :integer
  end
end
