class UsersController < ApplicationController

	load_and_authorize_resource
	
	def new
	    @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    flash[:notice] = "Registration successful ! Now you can create your visible profile.".html_safe
	    redirect_to new_person_path
	  else
	    render :action => 'new'	
	  end
	end

	def show
		require_user
	end

  def edit
    @user = User.find(params[:id])
  end

	def update
		@user = User.find(params[:id])
	  respond_to do |format|
	    if @user.update_attributes(params[:user])
	      format.html  { redirect_to(@user,
	                    :notice => 'User was successfully updated.') }
	      format.json  { head :no_content }
	    else
	      format.html  { render :action => "edit" }
	      format.json  { render :json => @post.errors,
	                    :status => :unprocessable_entity }
	    end
		end
	end

	def index
		redirect_to account_path
	end
end
