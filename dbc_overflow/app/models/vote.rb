class Vote < ActiveRecord::Base
  attr_accessible :positive
  validates_uniqueness_of :user_id, scope: [:voteable_type, :voteable_id]
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end