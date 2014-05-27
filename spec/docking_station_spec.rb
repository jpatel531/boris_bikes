require 'docking_station'

describe DockingStation do 

	it "should have a default capacity of 15" do
		default_station = DockingStation.new
		15.times {default_station.dock Bike.new}
		expect(default_station).to be_full
	end

end