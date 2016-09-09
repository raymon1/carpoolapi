class Trip < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  belongs_to :source, class_name: 'Place'
  belongs_to :destination, class_name: 'Place'
  has_many :trip_joins
  has_many :users, through: :trip_joins

  validates :driver, :source, :destination, :departure_time, :seats, presence: true
  validates :seats, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
