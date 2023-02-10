class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :bike_type, presence: true
  validates :description, length: { minimum: 15 }
  TYPE = %w(electric road mountain folding kids hybrid city trike)
  validates :bike_type, inclusion: { in: TYPE }
  validates :price, presence: true, numericality: { only_float: true }
  has_one_attached :photo
end
