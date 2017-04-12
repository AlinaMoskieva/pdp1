class Feedback
  include ActiveModel::Model

  attr_accessor :email, :subject, :content

  validates :email, :subject, :content, presence: true
end
