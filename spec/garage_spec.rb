require_relative "../lib/garage"

describe Garage do

	let(:garage) { Garage.new(:capacity => 100) }
	let(:bike) { Bike.new }
	it "should allow setting default capacity on initializing" do
		expect(garage.capacity).to eq(100)
	end
	
	it "should fix broken bikes" do
		bike.break
		garage.dock(bike)
		expect(garage.broken_bikes.count).to eq(1)
		garage.fix_bikes
		expect(garage.broken_bikes.count).to eq(0)
	end
end