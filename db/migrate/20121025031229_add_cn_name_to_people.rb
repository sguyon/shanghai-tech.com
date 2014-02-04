class AddCnNameToPeople < ActiveRecord::Migration
  def change
    rename_column :people, :name, :name_en
    add_column :people, :name_cn, :string 
  end
end
