class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  after_filter :set_charset

  helper_method :current_user_session, :current_user,:current_admin

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def set_charset
    unless headers["Content-Type"] =~ /charset/i
    headers["Content-Type"] ||= ""
    headers["Content-Type"] += "; charset=utf-8"
    end
  end 

  def set_locale
    if params[:locale].blank?
      redirect_to "/#{extract_locale_from_accept_language_header}" unless request.path.include? "/admin"
    else
      I18n.locale = params[:locale]
    end
  end

  def extract_locale_from_accept_language_header
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym) 
    if I18n.available_locales.include? browser_locale
      browser_locale
    else
      I18n.default_locale
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  def current_admin
    @current_admin = current_user && current_user.admin
  end

  def logged_in?
    !!current_user
  end

  def require_user
    logger.debug "ApplicationController::require_user"
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def log_changes
    id = params[:id].presence.to_s
    # ACTION CONTROLLER - ID - DETAIL
    entry = params[:action].upcase + " - " + params[:controller].upcase + " - " + id + " - PARAMS: " + params.inspect

    if Rails.env.production?
      Pony.mail({
        :to => 'contact@shanghai-tech.com',
        :from => 'contact@shanghai-tech.com',
        :subject => "[SH-TECH] " +  params[:action] + " " + params[:controller] + " " + id,
        :body => entry,
      })    
    end
    PostLogger.info(entry)
    
  end


end