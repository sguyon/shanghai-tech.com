class Job < ActiveRecord::Base
  attr_accessible :title_en,:title_cn, :short_description, :long_description, :website, :email, :user_id, :company_id, :job_types, :company, :job_type_ids
  belongs_to :user
  belongs_to :company
  has_and_belongs_to_many :job_types

  validates :title_en, :title_cn, :short_description, :long_description, :job_types, :company, :presence => true


  def title
    if (I18n.locale == :zh)
      self.title_cn
    else
      self.title_en
    end
  end

  def title_alt
    if (I18n.locale == :zh)
      self.title_en
    else
      self.title_cn
    end
  end
end