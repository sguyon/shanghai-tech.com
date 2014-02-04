class RemovePhotoUrlFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :photo_url
  end
end
