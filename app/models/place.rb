class Place < ApplicationRecord
	validates :name, uniqueness: true, presence: true
	validates :longitude, :latitude, presence: true
end
