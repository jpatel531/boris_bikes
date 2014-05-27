require 'bike_container'

class Van

include BikeContainer

def get_broken_bikes_from(station)
	station.broken_bikes.each {|bike| bikes << bike}
end

end