require 'garage'

describe Garage do

let(:garage) {Garage.new}
let(:bike) {Bike.new}
let(:van) {Van.new}


it "should receive a bike from a van" do
	van.dock bike.break!
	van.return_bikes_to garage
	expect(garage.bikes).to eq [bike]
end

it "should receive multiply bikes from a van" do
	bike1 = bike.break!
	bike2 = Bike.new.break!
	van.dock bike1
	van.dock bike2
	van.return_bikes_to garage
	expect(garage.bikes).to eq [bike1, bike2]
end

it "should fix a docked bike" do
	garage.dock bike
	garage.repair_bikes
	expect(bike).not_to be_broken
end

it "should fix multiple docked bikes" do
	broken_bike1 = Bike.new
	broken_bike2 = Bike.new
	broken_bike1.break!
	van.dock broken_bike1.break!
	van.dock broken_bike2.break!
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
