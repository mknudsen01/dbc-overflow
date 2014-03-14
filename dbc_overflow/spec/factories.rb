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
end