after :article do
  20.times do
    Comment.create!(user_id: Faker::Number.between(1, User.count),
      article_id: Faker::Number.between(1, Article.count),
      body: Faker::Lorem.sentence(3, true, 4))
  end
end
