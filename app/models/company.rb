class Company < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :image, :description, :blog_feed, :email, :linkedin, :name_en, :name_cn, :title, :twitter, :website, :weibo, :user_id, :person_ids,:adress,:longitude,:latitude,:remote_image_url,:company_types, :company_type_ids,:remove_image, :image_cache
  belongs_to :user
  has_many :jobs
  has_and_belongs_to_many :people
  has_and_belongs_to_many :company_types
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes

  validates :name_en, :name_cn, :description, :company_types, :adress, :presence => true
  
  acts_as_gmappable :check_process => false,
                    :process_geocoding => true, # false == when have no connection
                    :address =>"gmaps4rails_address",
                    :validation => true,
                    :msg => "Sorry, not even Google could figure out where that is"
                    

  def gmaps4rails_address
    self.adress
  end
  
  def gmaps4rails_marker_picture
  {
     "picture" => "/marker.png",
     "width" => 12,
     "height" => 21
    }
  end

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

  def gmaps4rails_title
    self.name
  end

	def self.get_sample
		Company.find(:all).sample(4)
	end

  def self.get_company_types
	  CompanyType.all.to_select
  end

  # i know it's really ugly
  def get_style
    style = ''
    style = style + '@media (min-width: 1200px){#company' + self.id.to_s + ' {padding-bottom:' + pad(269) + 'px;padding-top:' + pad(269) + 'px;}}'
    style = style + '@media (min-width: 980px) and (max-width: 1199px) {#company' + self.id.to_s + ' {padding-bottom:' + pad(246) + 'px;padding-top:' + pad(246) + 'px;}}'
    style = style + '@media (min-width: 768px) and (max-width: 979px) {#company' + self.id.to_s + '  {padding-bottom:' + pad(218) + 'px;padding-top:' + pad(218) + 'px;}}'
    style = style + '@media (max-width: 767px) {#company' + self.id.to_s + '  {padding-bottom:0px;padding-top:0px;}}'
    style
  end

  # get padding -top & -bottom
  def pad(the_height)
    self.image_height.presence ? ((the_height - self.image_height) /2).to_s : "0"
  end

def update_image_attributes
  if image.present?
    self.image_width, self.image_height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
  end
end



end