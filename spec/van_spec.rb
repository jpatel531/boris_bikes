require 'van'
require 'bike'

describe Van do

	let(:station) {DockingStation.new}
	let(:van) {Van.new}
	let(:bike) {Bike.new}
	let(:garage) {Garage.new}

	context "when it has no bikes" do 

		it "should be able to pick up bikes from the garage" do
			garage.dock bike
			garage.release_bikes_to(van)
			expect(van.bikes).to eq [bike]
		end

		it "should be able to only pick up broken bikes from station" do 
			broken1, working1 = Bike.new.break!, Bike.new
			bike_sample = [broken1, working1]
			bike_sample.each {|bike| station.dock bike }
			van.get_broken_bikes_from(station)
			expect(van.bikes).to eq [broken1]
		end

		it "raises an error if you try to deliver nothing" do
			expect(lambda {van.return_bikes_to station}).to raise_error(RuntimeError)
		end
	end

	context "once it has a bike" do
		before {van.dock bike}

		it "should be able to drop off bikes to station" do
			expect(station).to receive(:dock)
			van.return_bikes_to(station)
		end

		it "should be able to return bikes to garage" do 
			bike.break! 
			expect(garage).to receive(:dock)
			van.return_bikes_to(garage)
		end
			
		it "has no bikes after returning bikes" do
			van.return_bikes_to(station)
			expect(van.bikes).to be_empty
		end

		it "cannot return fixed bikes to the garage" do
			expect(lambda {van.return_bikes_to garage}).to raise_error(RuntimeError)
		end

		it "cannot return broken bikes to station" do
			bike.break!
			expect(lambda {van.return_bikes_to station}).to raise_error(RuntimeError)
		end
	end
end