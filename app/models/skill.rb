class Skill < ActiveRecord::Base
  attr_accessible :name_en,:name_cn

  def name
    if (I18n.locale == :zh)
      self.name_cn
    else
      self.name_en
    end
  end

  def name_alt
    if (I18n.locale == :zh)
      self.name_en
    else
      self.name_cn
    end
  end
  
end
