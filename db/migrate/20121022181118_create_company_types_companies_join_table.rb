class CreateCompanyTypesCompaniesJoinTable < ActiveRecord::Migration
  def change
    create_table :companies_company_types, :id => false do |t|
      t.integer :company_id
      t.integer :company_type_id
    end
  end
end
