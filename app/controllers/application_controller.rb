class ApplicationController < ActionController::Base
  before_filter :authenticate!

  protect_from_forgery

	private

	def authenticate!
	  redirect_to(sign_in_url) unless current_user
	end

	def current_user
	  @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
	end

	helper_method :current_user
end
