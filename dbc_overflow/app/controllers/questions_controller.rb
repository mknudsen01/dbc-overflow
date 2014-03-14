class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.body = params[:question][:body]
    @question.title = params[:question][:title]
    #logic for current user goes here
    if @question.save
      redirect_to question_path(@question)
    else
      #put errors in flash here
      redirect_to new_question_path
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question
      @question.body = params[:question][:body]
      @question.title = params[:question][:title]
      redirect_to( question_path(@question) ) && return if @question.save
    end
    #render errors
    redirect_to edit_question_path
  end
end