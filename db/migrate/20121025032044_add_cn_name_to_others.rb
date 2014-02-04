class AddCnNameToOthers < ActiveRecord::Migration
  def change
    rename_column :skills, :name, :name_en
    add_column :skills, :name_cn, :string 
    
    rename_column :company_types, :name, :name_en
    add_column :company_types, :name_cn, :string   
    
    rename_column :event_types, :name, :name_en
    add_column :event_types, :name_cn, :string       

    rename_column :companies, :name, :name_en
    add_column :companies, :name_cn, :string       

    rename_column :events, :name, :name_en
    add_column :events, :name_cn, :string
  end
end