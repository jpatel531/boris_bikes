require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(capacity_hash = {})
		self.capacity = capacity_hash.fetch(:capacity, capacity)
	end

end