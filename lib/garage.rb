require 'bike_container'

class Garage

include BikeContainer

def accept(bikes)
	bikes.each do |bike|
	bike.fix!
	dock bike
	end
end

end