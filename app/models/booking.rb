class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  has_many :bikes
  has_many :users
  has_one_attached :photo
  validates :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than: :end_date }
end
