RailsAdmin.config do |config|
  config.main_app_name = ["SH-TECH", "Admin"]
  #config.current_user_method { current_user }
  
  config.authorize_with{
    unless current_user && current_user.admin?
      #session[:return_to] = request.url
      redirect_to "/", :alert => "You are not authorized..."
    end
  } 

# config.authorize_with do
#     redirect_to root_path, :alert => "You are not administrator." unless current_user.admin?
# end
  
  # config.authorize_with do
  #   if !current_user || !current_user.admin?
  #     redirect_to "/"
  #   end
  # end   
  #config.authorize_with :cancan
  # { redirect_to root_path, :alert => "You are not authorized to access that page" unless current_user.admin? }
end

