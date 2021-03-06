# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  password = ''
  8.times { password << rand(10).to_s }
  User.create(username: CoolFaker::Character.name, email: Faker::Internet.email, password: password, password_confirmation: password)
end
User.create(username: "test", email: "test@test.com", password: "testtest", password_confirmation: "testtest")


10.times do
  index = Random.rand(User.count) + 1
  question = Question.create(title: CoolFaker::Team.slogan + '?', body: Faker::Lorem.paragraph)
  question.user = User.find(index)
  question.save
end

20.times do
  index = Random.rand(User.count) + 1
  answer = Answer.create(body: Faker::Lorem.paragraph)
  answer.user = User.find(index)

  index = Random.rand(Question.count) + 1
  Question.find(index).answers << answer
  answer.save
end

# Adding Comments to Questions
10.times do
  index = Random.rand(User.count) + 1
  comment = Comment.create(body: Faker::Lorem.sentence)
  comment.user = User.find(index)

  index = Random.rand(Question.count) + 1
  comment.commentable = Question.find(index)
  comment.save
  p comment
end

# Adding Comments to Answers
10.times do
  index = Random.rand(User.count) + 1
  comment = Comment.create(body: Faker::Lorem.sentence)
  comment.user = User.find(index)

  index = Random.rand(Answer.count) + 1
  comment.commentable = Answer.find(index)
  comment.save
  p comment
end



p "Users: #{User.count} - Questions: #{Question.count} - Answers #{Answer.count} - Comments #{Comment.count}"
