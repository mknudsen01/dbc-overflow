FactoryGirl.define do


  factory :question do
    title { CoolFaker::Team.name }
    body { CoolFaker::Team.slogan }
  end

  factory :answer do
    body { CoolFaker::Team.slogan }
    question_id { Question.last.id }
  end


  factory :comments do
    body { Faker::Lorem.paragraph }
  end

  factory :user do
    username { CoolFaker::Team.slogan }
    email { Faker::Internet.email }
    password { 'testing' }
    password_confirmation { 'testing' }
  end


end