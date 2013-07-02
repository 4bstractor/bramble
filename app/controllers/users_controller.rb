class UsersController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to sign_in_url, :notice => "Signed Up!"
    else
      render :new
    end
  end

  # Profile action for the user
  def me
    @user = current_user
  end
end
