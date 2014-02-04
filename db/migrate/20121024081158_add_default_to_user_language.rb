class AddDefaultToUserLanguage < ActiveRecord::Migration
  def up
      change_column :users, :language, :string, :default => 'en'
  end

  def down
      change_column :users, :language, :string, :default => nil
  end
end