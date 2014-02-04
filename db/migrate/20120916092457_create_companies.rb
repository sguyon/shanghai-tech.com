class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :bio
      t.string :twitter
      t.string :weibo
      t.string :website
      t.string :linkedin
      t.string :blog_feed

      t.timestamps
    end
  end
end
