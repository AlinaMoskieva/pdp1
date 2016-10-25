class ArticleDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  include ActionView::Helpers::DateHelper

  delegate :title, :text, :user
  delegate :full_name, to: :user, prefix: true

  def author
    "Author: #{user_full_name}"
  end

  def preview_title_link
    link_to object.title.truncate(45), article
  end

  def preview_text
    object.text.html_safe.truncate(230)
  end

  def time_since_creation
    time_ago_in_words(object.created_at)
  end
end
