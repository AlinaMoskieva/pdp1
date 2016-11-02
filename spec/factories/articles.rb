FactoryGirl.define do
  factory :article do
    title Faker::Lorem.sentence(3)
    text Faker::Lorem.paragraphs(2)
    user
  end
end
