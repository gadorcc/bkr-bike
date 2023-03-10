class Review < ApplicationRecord
  belongs_to :bike
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }
  belongs_to :user
end
