class CreatePeopleSkillsJoinTable < ActiveRecord::Migration

  def change
    create_table :people_skills, :id => false do |t|
      t.integer :person_id
      t.integer :skill_id
    end
  end
end
