class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :photo_url
      t.string :email
      t.string :bio
      t.string :twitter
      t.string :weibo
      t.string :website
      t.string :blog

      t.timestamps
    end
  end
end
