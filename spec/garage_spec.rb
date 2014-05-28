require 'garage'

describe Garage do

	let(:garage) {Garage.new}
	let(:bike) {Bike.new}
	let(:van) {Van.new}

	context "should receive" do

		before {van.dock bike.break!}

		it "a broken bike from a van" do
			van.return_bikes_to garage
			expect(garage.bikes).to eq [bike]
		end

		it "multiple broken bikes from a van" do
			van = Van.new([Bike.new.break!, Bike.new.break!])
			van.return_bikes_to garage
			expect(garage.bike_count).to eq 2
		end
	end

	context "should fix" do

		it "a docked bike" do
			garage.dock bike.break!
			garage.repair_bikes
			expect(bike).not_to be_broken
		end

		it "multiple docked bikes" do
			2.times {garage.dock Bike.new.break!}
			garage.repair_bikes
			expect(garage.broken_bikes).to be_empty
		end
	end

	context "releasing bikes" do
		before {garage.dock bike}

		it "can release bikes to a van" do
			expect(van).to receive(:dock)
			garage.release_bikes_to(van)
		end

		it "has no bikes" do
			garage.release_bikes_to(van)
			expect(garage.bikes).to be_empty
		end
	end
end
