require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	def fill_holder(holder) 
		15.times {holder.dock Bike.new} 
	end

	context "accepting bikes" do

			it "should accept a bike" do
				expect(holder.bike_count).to eq 0
				holder.dock bike
				expect(holder.bike_count).to eq 1
			end

			it "should know when it's full" do
				expect(holder).not_to be_full
				fill_holder holder
				expect(holder).to be_full
			end

			it "should have a default capacity of 15" do
				default_holder = ContainerHolder.new
				15.times {default_holder.dock Bike.new}
				expect(default_holder).to be_full
			end

			it "should not accept a bike if it's full" do
				fill_holder holder
				expect(lambda {holder.dock bike}).to raise_error(RuntimeError)
			end
	end

	context "releasing bikes" do
		it "should release a bike" do
			holder.dock bike
			holder.release bike
			expect(holder.bike_count).to eq 0
		end

		it "should decrease the bike count by 1 if released" do
			14.times {holder.dock Bike.new}
			holder.dock bike
			holder.release bike
			expect(holder.bike_count).to eq 14
		end

		it "cannot release a bike if it's at 0 capacity" do
			expect(lambda {holder.release bike}).to raise_error(RuntimeError)
		end
	end	

	context "should provide a list of" do

		it "available bikes" do
			working_bike, broken_bike = Bike.new, Bike.new
			broken_bike.break!
			holder.dock working_bike
			holder.dock broken_bike
			expect(holder.available_bikes).to eq [working_bike]
		end
	end
end
