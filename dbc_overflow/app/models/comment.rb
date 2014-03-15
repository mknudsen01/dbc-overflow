class Comment < ActiveRecord::Base
  include Voteable
  attr_accessible :body, :commentable
  validates_presence_of :body
  has_many :votes, :as => :voteable
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end