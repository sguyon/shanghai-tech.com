class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :email, :password, :password_confirmation,:admin,:language
  has_one :person
  has_many :companies
  has_many :events
  has_many :jobs


  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end

  def admin?
    !!self.admin
  end

end

