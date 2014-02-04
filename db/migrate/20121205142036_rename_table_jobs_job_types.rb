class RenameTableJobsJobTypes < ActiveRecord::Migration
  def up
    rename_table('jobs_job_types', 'job_types_jobs')
  end

  def down
    rename_table('job_types_jobs', 'jobs_job_types')
  end
end
