class Answer < ActiveRecord::Base
  include Voteable
  attr_accessible :body
  validates_presence_of :body
  belongs_to :user
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  belongs_to :question
end