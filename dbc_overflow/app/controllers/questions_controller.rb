class QuestionsController < ApplicationController

  before_filter :redirect_if_logged_out, :except => [:index, :show]

  def index
    @questions = Question.all.sort_by{|q| -q.votecount}
  end

  def show
    @question = Question.find(params[:id])
    @best_answer = Answer.find_by_id(@question.best_answer_id)
    @answers = @question.answers.sort_by {|a| -a.votecount}
    @answers_count = @answers.count
    @answers -= [@best_answer]
    @question_owner = owner?(@question)
    @user = session[:id]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.body = params[:question][:body]
    @question.title = params[:question][:title]
    @question.user = User.find(session[:id])
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

  def mark_best_answer
    @question = Question.find params[:id]

    params[:id]
  end
end