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

		before {garage.dock bike.break!}

		it "a docked bike" do
			garage.repair_bikes
			expect(bike).not_to be_broken
		end

		it "multiple docked bikes" do
			garage.dock Bike.new.break!
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

		it "has bikes after trying to release to a full van" do
			15.times {van.dock Bike.new}
			garage.release_bikes_to van
			expect(van.bikes).not_to be_empty
		end
	end

	context "if empty" do
		it "cannot release anything to van" do
			expect(lambda {garage.release_bikes_to van}).to raise_exception(EmptyException)
		end
	end
end
