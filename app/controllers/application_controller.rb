class ApplicationController < ActionController::Base
  before_filter :authenticate!

  protect_from_forgery

  private

  def authenticate!
    redirect_to(index_url) unless current_user
  end

  def current_user
    if params[:access_token]
      @current_user ||= User.find_by_access_token(params[:access_token])
    else
      @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
    end
  end

  helper_method :current_user
end
