class FullException < Exception ; end
class EmptyException < Exception ; end

module BikeContainer

	DEFAULT_CAPACITY = 15

	attr_accessor :capacity

	def bikes
		@bikes ||= []
	end

	def bike_count
		bikes.count
	end

	def capacity
		@capacity ||= 15
	end

	def dock(bike)
		raise FullException.new("We're full bro") if full?
		bikes << bike
	end

	def release(bike)
		raise EmptyException.new("This is empty bro") if bike_count == 0
		bikes.delete(bike)
		bike
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

end