class AddWidthHeightToPeople < ActiveRecord::Migration
  def change
    add_column :people, :image_width, :integer
    add_column :people, :image_height, :integer
  end
end
