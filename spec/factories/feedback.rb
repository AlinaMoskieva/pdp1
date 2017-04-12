FactoryGirl.define do
  factory :feedback do
    email Faker::Internet.email
    subject Faker::Lorem.sentence(1)
    content Faker::Lorem.sentence(1)
  end
end
