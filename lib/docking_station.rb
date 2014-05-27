class DockingStation
	DEFAULT_CAPACITY = 15
	def initialize(capacity_hash = {})
		@capacity = capacity_hash.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
	end

	def release(bike)
		raise "There are no bikes" if bike_count == 0
		@bikes.delete(bike)
		bike
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject { |bike| bike.broken? }
	end


end