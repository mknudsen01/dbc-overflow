class UsersController < ApplicationController

  before_filter :redirect_if_logged_in,  :except => [:index,:show]

  def index
    redirect_to user_path(id: current_user.id) if logged_in?
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end



end