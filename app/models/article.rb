class Article < ActiveRecord::Base
  paginates_per 5

  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, :text, presence: true
end
