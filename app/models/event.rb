class Event < ActiveRecord::Base
  attr_accessible :image, :blog_feed, :description, :email, :name_en, :name_cn, :twitter, :website, :weibo, :user_id,:person_ids,:remote_image_url,:event_type_ids,:remove_image, :image_cache
  belongs_to :user
  has_and_belongs_to_many :people
  has_and_belongs_to_many :event_types
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes

  validates :name_en, :name_cn, :description, :event_types, :presence => true

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

	def self.get_sample
		Event.find(:all).sample(4)
	end

  	def self.get_event_types
		EventType.all.to_select
	end

  def get_style
    style = ''
    style = style + '@media (min-width: 1200px){#event' + self.id.to_s + ' {padding-bottom:' + pad(269) + 'px;padding-top:' + pad(269) + 'px;}}'
    style = style + '@media (min-width: 980px) and (max-width: 1199px) {#event' + self.id.to_s + ' {padding-bottom:' + pad(246) + 'px;padding-top:' + pad(246) + 'px;}}'
    style = style + '@media (min-width: 768px) and (max-width: 979px) {#event' + self.id.to_s + '  {padding-bottom:' + pad(218) + 'px;padding-top:' + pad(218) + 'px;}}'
    style = style + '@media (max-width: 767px) {#event' + self.id.to_s + '  {padding-bottom:0px;padding-top:0px;}}'
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