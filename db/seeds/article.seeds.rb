after :users do
  30.times do |article|
    Article.create!(title: Faker::Lorem.sentence(3, true, 4),
      text: Faker::Lorem.paragraph(20),
      user_id: Faker::Number.between(1, User.count))
  end
end
