class Api::V1::SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => [:create]

  respond_to :json

  def create
    user = User.find_by_identifier(params[:identifier])
    if user && user.authenticate(params[:password])
      # Generate a new access token each login
      user.regenerate_access_token
      render :json => { 
        :success => true,
	:access_token => user.access_token,
	:info => "Signed In" },
	:status => 200
    else
      render :json => {
        :success => false,
	:access_token => nil,
	:info => "Invalid Identifier Or Password" },
	:status => 401 # TODO: Check this status return
    end
  end

  def destroy
    # Invalidate current access_token
    if current_user.regenerate_access_token
      render :json => {
        :success => true,
	:info => "Signed Out" },
	:status => 200
    else
      # May be unnecessary, also check the return status
      render :json => {
        :success => false,
	:info => "Unknown Error Code A11" },
	:status => 401
    end
  end
end
