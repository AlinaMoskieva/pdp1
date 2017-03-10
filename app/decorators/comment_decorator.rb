class CommentDecorator < ApplicationDecorator
  delegate :body, :user
  delegate :full_name, to: :user, prefix: true

  def time_since_creation
    time_ago_in_words(object.created_at)
  end
end
