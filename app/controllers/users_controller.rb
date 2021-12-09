class UsersController < ApplicationController
	skip_before_action :authenticate!, :only => [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to sign_in_url, :notice => 'Signed Up!'
  	else
  		render :new
  	end
  end

  def me
  	@user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :quote, :salt, :password, :password_confirmation)
  end  
end
