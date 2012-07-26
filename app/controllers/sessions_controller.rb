class SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged In!"
	  else
		  flash.now.alert "Invalid Email Or Password"
			render "new"
		end
	end

	def destroy
	  session[:user_id] = nil
		redirect_to root_url, :notice => "Logged Out!"
	end
end
