class SearchesController < ApplicationController
  def search
    term = "%#{params[:search]}%"
    question_by_answers = Answer.where("body like ?", term).map{ |answer| answer.question }
    @questions = Question.where("title LIKE ? OR body like ?", term , term) + question_by_answers
    @questions.sort_by! {|question| -question.votecount }
    render :"questions/index"
  end
end