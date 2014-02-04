class ChangeDescriptionsToText < ActiveRecord::Migration
def up
    change_column :companies, :description, :text
    change_column :people, :description, :text
    change_column :people, :question1, :text
    change_column :people, :question2, :text
    change_column :people, :question3, :text
    change_column :people, :question4, :text
    change_column :events, :description, :text

end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :companies, :description, :string
    change_column :people, :description, :string
    change_column :people, :question1, :string
    change_column :people, :question2, :string
    change_column :people, :question3, :string
    change_column :people, :question4, :string
    change_column :events, :description, :string    
end
end
