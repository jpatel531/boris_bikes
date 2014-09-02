class OnlyOneBro < Exception ; end

class Person

	attr_reader :bike

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def bikes
		[@bike]
	end
	
	def has_an_accident
		@bike.break!
	end

	def rent_bike_from(station)
		raise OnlyOneBro.new("Dude, you can only rent one") if has_bike?
		begin
		an_available_bike = station.available_bikes.first
		@bike = station.rent_out an_available_bike
		rescue OnlyOneBro => e
			e.message
		end 
	end

	def return_bike_to(station)
		begin
		station.dock bike
		@bike = nil
		rescue FullException => e 
			e.message
		end
	end

end