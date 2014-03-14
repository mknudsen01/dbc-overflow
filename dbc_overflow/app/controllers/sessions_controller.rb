class SessionsController < ApplicationController

    before_filter :redirect_if_logged_in, :only => [:create]
    before_filter :redirect_if_logged_out, :only => [:destroy]
  def create
    user =User.find_by_email(params[:users][:email])
    if user && user.authorized?(params)
      session[:id] = user.id
      redirect_to user
    else
      flash[:error] = 'Invalid Login'
      redirect_to users_path
      end
    end

  def destroy
    reset_session
    flash[:message] = 'You are logged out.'
    redirect_to users_path
  end

end