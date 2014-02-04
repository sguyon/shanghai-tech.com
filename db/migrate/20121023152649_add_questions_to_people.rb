class AddQuestionsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :question1, :string
    add_column :people, :question2, :string
    add_column :people, :question3, :string
    add_column :people, :question4, :string
  end
end
