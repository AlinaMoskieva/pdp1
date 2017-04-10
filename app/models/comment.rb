class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user, :article, :body, presence: true
end
