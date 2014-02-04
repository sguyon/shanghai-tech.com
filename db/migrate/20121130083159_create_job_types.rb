class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :name_en
      t.string :name_cn

      t.timestamps
    end
  end
end
