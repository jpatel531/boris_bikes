class Person

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
	@bike = station.release station.available_bikes.last
end

end