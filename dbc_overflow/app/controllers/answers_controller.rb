class AnswersController < ApplicationController


  # def show
  #   dont need this
  # end

  def new
    @answer = Answer.new
  end

  def create
    #add logic here to make sure question is correct
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    @answer.body = params[:answer][:body]

    if @answer.save
      redirect_to question_path( @question )
    else
      #put errors in flash here
      redirect_to new_question_answer_path
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer
      @answer.body = params[:answer][:body]
      redirect_to( question_path(@answer.question) ) && return if @answer.save
    end
    #render errors
    redirect_to edit_question_answer_path(@answer.question, @answer)
  end


  # def destroy
    # NOT PART of MVP
    # only if it has negative votes should you be able to delete
  # end
end