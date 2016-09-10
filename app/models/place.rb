class Place < ApplicationRecord
	validates :name, uniqueness: true, presence: true
	validates :longitude, :latitude, presence: true
	validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  	validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }

end
