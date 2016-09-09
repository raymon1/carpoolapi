class TripJoin < ApplicationRecord
	belongs_to :user
	belongs_to :trip

	validate :trip_has_available_seats
	validates_uniqueness_of :trip_id, scope: :user_id
	after_create :trip_seats_minus_one
	after_destroy :trip_seats_plus_one

	def trip_has_available_seats
		if self.trip.seats < 1
			errors.add(:trip, "has no available seats")
		end
	end

	private 

	def trip_seats_minus_one
		trip = self.trip
		trip.seats = trip.seats - 1
		trip.save
	end

	def trip_seats_plus_one
		trip = self.trip
		trip.seats = trip.seats + 1
		trip.save
	end
end
