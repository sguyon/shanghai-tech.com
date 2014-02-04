class Notifier < ActionMailer::Base

  default_url_options[:host] = 'www.shanghai-tech.com'
  default_url_options[:protocol] = 'http'

  def password_reset_instructions(user)
    link = edit_password_reset_url(I18n.locale,user.perishable_token)
    body = "A request to reset your password has been made. If you did not make
      this request, simply ignore this email. If you did make this
      request, please follow the link below:

      #{link}
      "
    mail(
      :subject   =>   "Password Reset Instructions",
      :from =>        "noreply@shanghai-tech.com",
      :to =>  user.email,
      :date =>     Time.now,
      :body => body
    ) 
    logger.debug body
  end
end