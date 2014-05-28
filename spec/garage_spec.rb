require 'garage'

describe Garage do

let(:garage) {Garage.new}
let(:bike) {Bike.new}
let(:van) {Van.new}

it "should fix a docked bike" do
	garage.accept [bike]
	expect(bike).not_to be_broken
end

it "should fix multiple docked bikes" do
	bikes = [bike, Bike.new, Bike.new]
	garage.accept bikes
	faulty_bikes = garage.bikes.select {|bike| bike.broken? }
	expect(faulty_bikes).to be_empty
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
