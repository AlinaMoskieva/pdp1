3.times do |user|
  User.create!(email: Faker::Internet.email,
    full_name:  Faker::Name.name ,
    password: Faker::Internet.password,
    confirmed_at: DateTime.now
    )
end
