class Addlabeltojobtype < ActiveRecord::Migration
  def change
    add_column :job_types, :label, :string
  end
end
