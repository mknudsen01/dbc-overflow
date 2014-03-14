FactoryGirl.define do

  factory :question do
    title { CoolFaker::Team.name }
    body { CoolFaker::Team.slogan }

  end


end