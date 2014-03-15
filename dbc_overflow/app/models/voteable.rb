module Voteable

  def upvotes
    self.votes.where(positive: true).count
  end

  def downvotes
    self.votes.where(positive: false).count
  end

  def votecount
    self.upvotes - self.downvotes
  end
end