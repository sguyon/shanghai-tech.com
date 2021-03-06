class UserSessionsController < ApplicationController

  #load_and_authorize_resource

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy



  def index
    if current_user
      redirect_to users_url
    else
      redirect_to new_user_session_url
    end
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default users_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
end
