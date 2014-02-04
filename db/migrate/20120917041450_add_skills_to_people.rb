class AddSkillsToPeople < ActiveRecord::Migration
  def change
  	 add_column :people, :skill1, :string
  	 add_column :people, :skill2, :string
  	 add_column :people, :skill3, :string
  end
end
