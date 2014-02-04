class RenameDatabaseColumn < ActiveRecord::Migration
  def up
  	rename_column :people, :title, :position
  end

  def down
  	rename_column :table, :position, :title
  end
end
