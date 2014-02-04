class ChangeBioToDesc < ActiveRecord::Migration
  def up
    remove_column :people, :bio
    add_column :people, :description, :string
  end

  def down
    add_column :people, :bio, :string
    remove_column :people, :description
  end
end
