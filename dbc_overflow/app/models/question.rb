class Question < ActiveRecord::Base
  include Voteable
  attr_accessible :title, :body, :best_answer_id
  validates_presence_of :title, :body
  has_many :answers
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  belongs_to :user
end