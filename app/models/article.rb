class Article < ActiveRecord::Base
  paginates_per 5
  belongs_to :user

  validates :title, :text, presence: true
end
