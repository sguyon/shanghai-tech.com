class ChangeJob < ActiveRecord::Migration
  def change
    add_column :jobs, :title_en, :string
    add_column :jobs, :title_cn, :string
    add_column :jobs, :short_description, :string
    add_column :jobs, :long_description, :text
    add_column :jobs, :website, :string
    add_column :jobs, :email, :string
    add_column :jobs, :company_id, :integer
  end
end