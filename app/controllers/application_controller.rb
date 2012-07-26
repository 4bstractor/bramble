class ApplicationController < ActionController::Base
  before_filter :authenticate!

  protect_from_forgery

	private

	def authenticate!
	  redirect_to(sign_in_url) unless current_user
	end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
end
