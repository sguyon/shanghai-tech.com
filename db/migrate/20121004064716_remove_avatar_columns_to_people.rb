class RemoveAvatarColumnsToPeople < ActiveRecord::Migration
  def up
    remove_attachment :people, :avatar
  end

  def down
    add_attachment :people, :avatar
  end
end