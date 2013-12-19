# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title Faker::Lorem.sentence
    url Faker::Internet.url
    text Faker::Lorem.paragraph
  end
end
