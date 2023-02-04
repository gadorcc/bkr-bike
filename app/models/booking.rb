class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :start_date, comparison: { greater_than: :end_date }
end
