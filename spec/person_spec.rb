require 'person'

describe Person do 

	it "should have no bike when created" do
		person = Person.new
		expect(person).not_to have_bike
	end

	it "can have a bike" do
		person = Person.new("Kikkle")
		expect(person).to have_bike
	end

	it "can have a bike accident" do
		bike = Bike.new
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.has_an_accident
	end

	it "can rent a bike from the station" do
		person = Person.new
		station = DockingStation.new
		expect(station).to receive(:release)
		person.rent_bike_from(station)
	end

	it "has a bike after renting from the station" do
		station = DockingStation.new
		station.dock Bike.new
		person = Person.new
		person.rent_bike_from(station)
		expect(person).to have_bike
	end
end