class AnswersController < ApplicationController

  def index

  end

  # def show
  #   dont need this
  # end

  def new
    @answer = Answer.new
  end

  def create
  end

  def edit
  end

  def update
  end


  # def destroy
    # NOT PART of MVP
    # only if it has negative votes should you be able to delete
  # end
end