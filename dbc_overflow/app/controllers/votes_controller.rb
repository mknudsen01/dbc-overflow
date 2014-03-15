class VotesController < ApplicationController
  before_filter :load_voteable
  before_filter :load_vote

  def upvote
    @vote.positive = true
    save_vote
  end

  def downvote
    @vote.positive = false
    save_vote
  end

  private

  def save_vote
    @vote.user = current_user
    @vote.save
    redirect_to :back
  end

  def load_vote
    @vote = @voteable.votes.find_or_create_by_user_id(current_user.id)
  end

  def load_voteable
    key = params.keys.select{ |key| key.match(/_id$/) }.first
    klass = key.gsub('_id','').classify.constantize
    @voteable = klass.find(params["#{key}"])
  end
end