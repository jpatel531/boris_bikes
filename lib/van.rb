require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(bikes = nil)
		@bikes = bikes
	end

	def get_broken_bikes_from(station)
		station.broken_bikes.each {|bike| bikes << bike}
	end

	def return_bikes_to(receiver)
		error_if(receiver)
		self.bikes.each {|bike| receiver.dock bike}
		bikes.clear
	end

	def error_if(receiver)
		if bikes.empty?
			raise "Nothing to deliver!"
		elsif receiver.is_a?(DockingStation) && !self.broken_bikes.empty?
			raise "Cannot return broken bikes to station!" 
		elsif receiver.is_a?(Garage) && self.broken_bikes.empty?
			raise "Cannot return working bikes to garage!"
		end
	end

end