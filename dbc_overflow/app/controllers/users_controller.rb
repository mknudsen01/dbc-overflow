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



end