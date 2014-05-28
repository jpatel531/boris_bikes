require 'bike_container'

class Garage

include BikeContainer

def accept(bikes)
	bikes.each do |bike|
	bike.fix!
	dock bike
	end
end

def release_bikes_to(van)
	van.dock bikes
	bikes.clear
end
end