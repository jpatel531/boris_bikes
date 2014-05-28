require 'person'

describe Person do 

let(:station) {DockingStation.new}
let!(:person) {Person.new}

	it "should have no bike when created" do
		expect(person).not_to have_bike
	end

	it "can have a bike" do
		person = Person.new("Kikkle")
		expect(person).to have_bike
	end

	it "can rent a bike from the station" do
		expect(station).to receive(:release)
		person.rent_bike_from(station)
	end

	it "has a bike after renting from the station" do
		station.dock Bike.new
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it "can return a bike" do
		expect(station).to receive(:dock)
		person.return_bike_to(station)
	end

	it "can have a bike accident" do
		bike = Bike.new
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.has_an_accident
	end

	it "has no bikes after returning a bike" do
		person = Person.new(:bike)
		person.return_bike_to(station)
		expect(person).not_to have_bike
	end
end