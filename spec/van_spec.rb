require 'van'
require 'bike'

describe Van do

let(:station) {DockingStation.new}
let(:van) {Van.new}
let(:bike) {Bike.new}

it "should be able to pick up broken bikes from station" do 
	van = Van.new
	broken1, broken2, broken3, working1, working2 = Bike.new, Bike.new, Bike.new, Bike.new, Bike.new
	broken1.break!
	broken2.break!
	broken3.break!
	bike_sample = [broken1, broken2, broken3, working1, working2]
	bike_sample.each {|bike| station.dock bike }
	van.get_broken_bikes_from(station)
	expect(van.bikes).to eq [broken1, broken2, broken3]
end

it "should be able to drop off bikes to station" do
	van.dock bike
	expect(station).to receive(:dock)
	van.return_bikes_to(station)
end

it "should be able to return bikes to garage" do 
	van.dock bike 
	garage = double :garage 
	expect(garage).to receive(:dock)
	van.return_bikes_to(garage)
end
	
it "has no bikes after returning bikes" do
	van.dock bike
	van.return_bikes_to(station)
	expect(van.bikes).to be_empty
end

it "cannot return broken bikes to station" do
	broken_bike = Bike.new.break!
	van.dock broken_bike
	expect(lambda {van.return_bikes_to station} ).to raise_error(RuntimeError)
end

end