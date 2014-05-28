require_relative 'bike_container'

class Garage

include BikeContainer


def repair_bikes
	bikes.each do |bike|
		bike.fix!
	end
end

def release_bikes_to(van)
	van.dock bikes
	bikes.clear
end
end