class Comment < ActiveRecord::Base
  paginates_per 5

  belongs_to :user
  belongs_to :article

  validates :user, :article, :body, presence: true
end
