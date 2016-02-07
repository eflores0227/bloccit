FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    # id rand(10000)
    name RandomData.random_name
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
end
