class Question < ActiveRecord::Base
  attr_accessible :title, :body, :best_answer_id

  has_many :answers

end