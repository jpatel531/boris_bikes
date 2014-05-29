require_relative 'bike_container'

class Garage

include BikeContainer

def repair_bikes
	bikes.each do |bike|
		bike.fix!
	end
end

def release_bikes_to(van)
	error_if(van)
	self.bikes.each {|bike| van.dock bike}
	bikes.clear
end

def error_if(van)
	if bikes.empty?
			raise "Nothing to deliver!"
	end
end

end