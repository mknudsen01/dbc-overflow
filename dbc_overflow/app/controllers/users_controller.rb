class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to root_path
    else
      flash[:error] = 'Email must be unique'
      redirect_to new_user_path
    end
  end

  def process_login
    user =User.find_by_email(params[:users][:email])
    #ApplicationHelper::logged_in?
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