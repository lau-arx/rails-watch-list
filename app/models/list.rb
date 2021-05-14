class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
  validates :photo, presence: true
end
