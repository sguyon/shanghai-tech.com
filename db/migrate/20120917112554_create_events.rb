class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :photo_url
      t.string :event_type
      t.string :email
      t.string :description
      t.string :twitter
      t.string :weibo
      t.string :website
      t.string :blog_feed

      t.timestamps
    end
  end
end
