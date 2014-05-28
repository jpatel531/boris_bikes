class Person

	attr_reader :bike

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def has_an_accident
		@bike.break!
	end

	def rent_bike_from(station)
		an_available_bike = station.available_bikes.first
		@bike = station.release an_available_bike
	end

	def return_bike_to(station)
		station.dock bike
		@bike = nil
	end

end