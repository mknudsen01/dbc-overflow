class ApplicationController < ActionController::Base

  protect_from_forgery

  protected

  def current_user
    User.find(session[:id])
  end

  def logged_in?
    !!session[:id]
  end

  def redirect_if_logged_out
    redirect_to :back unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to :back if logged_in?
  end



end
