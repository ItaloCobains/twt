FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password { 'password' }
    sequence(:username) { |n| "#{n}#{Faker::Internet.username}" }
  end
end
