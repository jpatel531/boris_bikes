require_relative 'bike_container'
require_relative 'docking_station.rb'
require 'debugger'

class Van
	include BikeContainer

	def get_broken_bikes_from(station)
		station.broken_bikes.each {|bike| bikes << bike}
	end

	def return_bikes_to(receiver)
		error_if(receiver)
		self.bikes.each {|bike| receiver.dock bike}
		bikes.clear
	end

	def error_if(receiver)
		if receiver.is_a?(DockingStation) && !self.broken_bikes.empty?
			raise "Cannot return broken bikes to station!" 
		end
	end


end