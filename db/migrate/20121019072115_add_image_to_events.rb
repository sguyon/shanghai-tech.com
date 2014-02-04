class AddImageToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :image, :string
    remove_column :events, :photo_url
  end
  def self.down
    add_column :events, :image, :string
    remove_column :events, :photo_url
  end
end