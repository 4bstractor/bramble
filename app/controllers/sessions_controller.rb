class SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
  	# Template Pointer
	end

	def create
	  user = User.find_by_identifier(params[:identifier])
	  if user && user.authenticate(params[:password])
	  	if params[:remember_me]
	  		cookies.permanent[:auth_token] = user.auth_token
	  	else
	  		cookies[:auth_token] = user.auth_token
	  	end
			redirect_to root_url, :notice => "Logged In!"
	  else
		  flash[:alert] = "Invalid Identifier Or Password"
			render "new"
		end
	end

	def destroy
	  cookies.delete(:auth_token)
		redirect_to root_url, :notice => "Logged Out!"
	end
end
