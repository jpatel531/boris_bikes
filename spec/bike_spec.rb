require 'bike'

describe Bike do
	let(:bike) {Bike.new}

	context "when created" do
		it "should not be broken" do
			expect(bike).not_to be_broken
		end
	end

	context "when breaking" do
		before {bike.break!}

		it "should break" do
			expect(bike).to be_broken
		end

		it "can get fixed" do
			bike.fix!
			expect(bike).not_to be_broken
		end
	end
end
