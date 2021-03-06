class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end
