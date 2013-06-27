class Api::V1::UsersController < ApplicationController
  skip_before_filter :authenticate!, :only => [:create]

  respond_to :json

  def create
    @user = User.new(
      :email => params[:email],
      :username => params[:username],
      :password => params[:password],
      :password_confirmation => params[:password_confirmation],
      :quote => params[:quote]
    )

    if @user.save
      render :json => {
        :success => true,
	:access_token => @user.access_token,
	:info => "Signed Up" },
	:status => 200
    else
      render :json => {
        :success => false,
	:access_token => nil,
	:info => @user.errors },
	:status => :unprocessable_entity # TODO: Replace this with the http code
    end
  end
end
