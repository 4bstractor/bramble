class ApplicationController < ActionController::Base
  before_filter :authenticate!

  protect_from_forgery

	private

	def authenticate!
	  unless current_user
	    redirect_to sign_in_url, :notice => "You Need To Sign In"
		end
	end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
end
