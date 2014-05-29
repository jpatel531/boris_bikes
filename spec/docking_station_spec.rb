require 'docking_station'

describe DockingStation do 

let(:station) {DockingStation.new}

	it "should have a default capacity of 15" do
		15.times {station.dock Bike.new}
		expect(station).to be_full
	end

end