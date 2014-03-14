class Question < ActiveRecord::Base

  attr_accessible :title, :body, :best_answer_id
  validates_presence_of :title, :body

  has_many :answers
  belongs_to :user
end