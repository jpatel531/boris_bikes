require 'bike_container'

class ContainerHolder; include BikeContainer; end
class FullException < Exception ; end
class EmptyException < Exception ; end

describe BikeContainer do
	
	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	def fill_holder(holder) 
		15.times {holder.dock Bike.new} 
	end

	context "accepting bikes" do

			it "should accept a bike" do
				expect {holder.dock bike}.to change {holder.bike_count}.from(0).to(1)
			end

			it "should know when it's full" do
				expect{fill_holder holder}.to change {holder.full?}.from(false).to(true)
			end

			it "should have a default capacity of 15" do
				15.times {holder.dock Bike.new}
				expect(holder).to be_full
			end

			it "should not accept a bike if it's full" do
				fill_holder holder
				expect(lambda {holder.dock bike}).to raise_exception(FullException)
			end
	end

	context "releasing bikes" do
		it "should release a bike" do
			holder.dock bike
			expect {holder.release bike}.to change {holder.bike_count}.from(1).to(0)
		end

		it "should decrease the bike count by 1 if released" do
			14.times {holder.dock Bike.new}
			holder.dock bike
			holder.release bike
			expect(holder.bike_count).to eq 14
		end

		it "cannot release a bike if it's at 0 capacity" do
			expect(lambda {holder.release bike}).to raise_exception(EmptyException)
		end	
	end

	context "should provide a list of" do

		it "available bikes" do
			working_bike, broken_bike = Bike.new, Bike.new.break!
			holder.dock working_bike
			holder.dock broken_bike
			expect(holder.available_bikes).to eq [working_bike]
		end
	end
end
