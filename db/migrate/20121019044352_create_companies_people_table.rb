class CreateCompaniesPeopleTable < ActiveRecord::Migration
  def self.up
    create_table :companies_people, :id => false do |t|
        t.references :company
        t.references :person
    end
    add_index :companies_people, [:company_id, :person_id]
    add_index :companies_people, [:person_id, :company_id]
  end

  def self.down
    drop_table :companies_people
  end
end