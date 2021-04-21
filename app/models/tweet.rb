class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
  validates :video_url, presence: true
  validates :image, presence: true
end
