require 'person'

describe Person do 

	let(:station) {DockingStation.new}
	let!(:person) {Person.new}

	context "when created" do

		it "should have no bike" do
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
			expect(station).to receive(:rent_out)
			person.rent_bike_from(station)
		end
	end

	context "renting a bike" do 

		it "has a bike" do
			station.dock Bike.new
			person.rent_bike_from(station)
			expect(person).to have_bike
		end

		it "can return a bike" do
			expect(station).to receive(:dock)
			person.return_bike_to(station)
		end
	end

	context "after returning a bike" do
		let(:person) {Person.new(:bike)}

		it "has no bikes" do
			person.return_bike_to(station)
			expect(person).not_to have_bike
		end

		it "still has the bike when the station is full" do 
			15.times {station.dock Bike.new}
			person.return_bike_to station
			expect(person).to have_bike
		end
	end
end