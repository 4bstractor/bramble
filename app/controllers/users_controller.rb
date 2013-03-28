class UsersController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      # Sign the user in as well
      # May be removed in the future to prevent botting and allow me to authenticate them
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed Up!"
    else
      render "new"
    end
  end

  def me
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
