class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :bike_postcode2, presence: true
  validates :description, length: { minimum: 15 }
  TYPE = %w[Electric Road Mountain Folding Kids Hybrid City Trike]
  validates :bike_type, inclusion: { in: TYPE }, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :photo, presence: true
  has_one_attached :photo
  geocoded_by :bike_postcode2
  after_validation :geocode, if: :will_save_change_to_bike_postcode2?
end
