class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true
  validates :description, length: { minimum: 15 }
  TYPE = %w(electric road mountain folding kids hybrid city trike)
  validates :type, inclusion: { in: TYPE }
  validates :price, presence: true, numericality: { only_float: true }
  has_many_attached :photos
end
