class Bike < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :type, presence: true
  TYPE = %w(electric road mountain folding kids hybrid city trike)
  validates :type, inclusion: { in: TYPE }
  validates :price, presence: true, numericality: { only_float: true }
end
