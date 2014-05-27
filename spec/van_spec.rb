require 'van'

describe Van do

let(:station) {DockingStation.new}
let(:van) {Van.new}

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
	
end