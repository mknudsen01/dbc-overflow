class CommentsController < ApplicationController
  before_filter :load_question
  before_filter :load_commentable
  before_filter :load_comment, except: :create
  def create
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      # @comment.user = current_user
      @comment.commentable = @commentable
    end
    redirect @question
  end

  def update
    @comment.update_attributes(params[:comment])
    redirect @question
  end

  def destroy
    @comment.delete
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def load_question
    @question = Question.find(params[:question_id]) if params[:question_id]
  end

  def load_commentable
    if params[:answer_id]
      @commentable = Question.find(params[:answer_id])
    else
      @commentable = @question
    end
  end
end

