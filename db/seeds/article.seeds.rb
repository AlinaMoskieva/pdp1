after :users do
  30.times do |article|
    # FactoryGirl
    # FactoryGirl.create_list(:article, 5, user: )
    Article.create!(title: Faker::Lorem.sentence(3, true, 4),
      text: Faker::Lorem.paragraph(20),
      user: User.all.sample)
  end
end
