class SessionsController < ApplicationController

  def create
    user =User.find_by_email(params[:users][:email])
    if user && user.authorized?(params)
      session[:id] = user.id
      session[:username] = user.username
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Invalid login.'
      redirect_to users_path
      end
    end

  def destroy
    reset_session
    flash[:message] = 'You are logged out.'
    redirect_to users_path
  end

end