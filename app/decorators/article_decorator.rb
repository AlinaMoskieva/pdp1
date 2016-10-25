class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :user
  delegate :full_name, to: :user, prefix: true

  def author
    "Author: #{user_full_name}"
  end
end
