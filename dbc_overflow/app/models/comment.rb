class Comment < ActiveRecord::Base
  attr_accessible :body
  validates_presence_of :body
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end