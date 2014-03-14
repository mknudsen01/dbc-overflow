class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    redirect_to root_path
  end

  def process_login
    user =User.find_by_email(params[:users][:email])
    if user && user.authorized?(params)
      session[:id] = user.id
      session[:username] = user.username
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Invalid login.'
      redirect_to root_path
      end
    end

  def logout
    reset_session
    flash[:message] = 'You are logged out.'
    redirect_to root_path
  end

end