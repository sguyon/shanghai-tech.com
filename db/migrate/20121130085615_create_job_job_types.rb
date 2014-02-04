class CreateJobJobTypes < ActiveRecord::Migration
  def change
    create_table :jobs_job_types, :id => false do |t|
      t.integer :job_id
      t.integer :job_type_id
    end
  end
end
