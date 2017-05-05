class CommentDecorator < ApplicationDecorator
  delegate :body, :user, :updated_at
  delegate :full_name, to: :user, prefix: true

  def time_since_creation
    time_ago_in_words(object.updated_at)
  end
end
