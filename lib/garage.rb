require_relative 'bike_container'

class Garage

include BikeContainer

def repair_bikes
	bikes.each do |bike|
		bike.fix!
	end
end

def release_bikes_to(van)
	raise EmptyException.new("Nothing to release bro") if bikes.empty?
	begin
	self.bikes.each {|bike| van.dock bike}
	bikes.clear
	rescue FullException => e
		e.message
	rescue EmptyException => e
		e.message
	end
end


end