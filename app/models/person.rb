class Person < ActiveRecord::Base
  attr_accessible :image, :description, :blog, :name_en, :name_cn, :twitter, :website, :weibo, :position,:user_id,:remote_image_url,:company_ids,:event_ids,:skill_ids,:question1,:question2,:question3,:question4,:remove_image, :image_cache
  belongs_to :user
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :events
  has_and_belongs_to_many :skills
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes

  validates :name_en, :description, :presence => true

    # defines Person::Skill enum class
    # NOTE Sacha : moved to active_enum.rb

  def name
    if (I18n.locale == :zh)
      if self.name_cn.presence
        self.name_cn
      else
          self.name_en
      end
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
  
	def self.get_sample
		Person.find(:all).sample(4)
	end

	def self.get_skills
		skills = ''
		skills = Skill.all.to_select
	end

  def get_style
    style = ''
    style = style + '@media (min-width: 1200px){#person' + self.id.to_s + ' {padding-bottom:' + pad(269) + 'px;padding-top:' + pad(269) + 'px;}}'
    style = style + '@media (min-width: 980px) and (max-width: 1199px) {#person' + self.id.to_s + ' {padding-bottom:' + pad(246) + 'px;padding-top:' + pad(246) + 'px;}}'
    style = style + '@media (min-width: 768px) and (max-width: 979px) {#person' + self.id.to_s + '  {padding-bottom:' + pad(218) + 'px;padding-top:' + pad(218) + 'px;}}'
    style = style + '@media (max-width: 767px) {#person' + self.id.to_s + '  {padding-bottom:0px;padding-top:0px;}}'
    style
  end

  def pad(the_height)
    if self.image_height.presence
      val = ((the_height - self.image_height) /2)
      if val<0 ? val=0 : val
        val = val.to_s
      end
    else
      val = "0"
    end
    val
  end

  def update_image_attributes
    if image.present?
      self.image_width, self.image_height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
    end
  end
end