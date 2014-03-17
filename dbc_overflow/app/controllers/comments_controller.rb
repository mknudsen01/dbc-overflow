class CommentsController < ApplicationController
  before_filter :load_question, except: [:destroy]
  before_filter :load_commentable, except: [:destroy]
  before_filter :load_comment, except: [:create, :new]

  def new
    # @answer = Answer.find(params)
    redirect_to '/batman' && return unless @commentable
    @comment = Comment.new
    render  :partial => 'shared/comment_form',
            :locals => {
              question: @question,
              comment: Comment.new,
              commentable: @commentable
            }
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      @comment.user = current_user
      @comment.commentable = @commentable
      @comment.save
    end
    redirect_to @question
  end

  def edit
    render  :partial => 'shared/comment_form',
            :locals => {
              question: @question,
              comment: @comment,
              commentable: @commentable
            }
  end

  def show

  end

  def update
    @comment.update_attributes(params[:comment])
    redirect_to @question
  end

  def destroy
    @comment.delete
    redirect_to :back
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def load_question
    if params[:question_id]
      @question = Question.find(params[:question_id])
    else
      @question = Answer.find(params[:answer_id]).question
    end

  end

  def load_commentable
    if params[:answer_id]
      @commentable = Answer.find(params[:answer_id])
    else
      @commentable = @question
    end
  end
end

