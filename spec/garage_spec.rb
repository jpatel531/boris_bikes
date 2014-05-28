require 'garage'

describe Garage do

	let(:garage) {Garage.new}
	let(:bike) {Bike.new}
	let(:van) {Van.new}

	context "receiving broken bikes" do

			before {van.dock bike.break!}

		it "should receive a bike from a van" do
			van.return_bikes_to garage
			expect(garage.bikes).to eq [bike]
		end

		it "should receive multiple bikes from a van" do
			van = Van.new([Bike.new.break!, Bike.new.break!])
			van.return_bikes_to garage
			expect(garage.bike_count).to eq 2
		end
	end

	it "should fix a docked bike" do
		garage.dock bike.break!
		garage.repair_bikes
		expect(bike).not_to be_broken
	end

	it "should fix multiple docked bikes" do
		van = Van.new([Bike.new.break!, Bike.new.break!])
		van.return_bikes_to garage
		garage.repair_bikes
		expect(garage.broken_bikes).to be_empty
	end

	it "should be able to release bikes to van" do
		garage.dock bike
		expect(van).to receive(:dock)
		garage.release_bikes_to(van)
	end

	it "has no bikes after releasing bikes" do
		garage.dock bike
		garage.release_bikes_to(van)
		expect(garage.bikes).to be_empty
	end

end
