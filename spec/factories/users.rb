# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password
    session_token SecureRandom.urlsafe_base64
  end
end
