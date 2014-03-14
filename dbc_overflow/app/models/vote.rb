class Vote < ActiveRecord::Base
  attr_accessible :positive
  validates_presence_of :positive
  validates_uniqueness_of :user_id, scope: :commentable
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end