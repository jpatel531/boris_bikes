class WrongContentsException < Exception ; end
class NoBikesException < Exception ; end

require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(bikes = nil)
		@bikes = bikes
	end

	def get_broken_bikes_from(station)
		begin
		station.broken_bikes.each {|bike| bikes << bike}
		station.bikes.clear
		rescue FullException => e 
			e.message
		rescue EmptyException => e
			e.message
		end
	end

	def return_bikes_to(receiver)
		error_if(receiver)
		begin
		self.bikes.each {|bike| receiver.dock bike}
		bikes.clear
		rescue FullException => e
			e.message 
		rescue WrongContentsException => e
			e.message
		rescue NoBikesException => e
			e.message
		end

	end

	def error_if(receiver)
		if bikes.empty?
			raise NoBikesException.new("There's nothing to deliver bro")
		elsif receiver.is_a?(DockingStation) && !self.broken_bikes.empty?
			raise WrongContentsException.new("Cannot return broken bikes to station!") 
		elsif receiver.is_a?(Garage) && self.broken_bikes.empty?
			raise WrongContentsException.new("Cannot return working bikes to garage!")
		end
	end

end