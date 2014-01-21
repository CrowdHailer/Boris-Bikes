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
		garage.fix_bikes
		expect(garage.broken_bikes.count).to eq(0)
	end

	it "should allow unlimited garage" do
		garage = Garage.new(capacity: -1)
		100000.times{garage.dock(Bike.new)}
		expect(garage.bike_count).to eq(100000)
	end
end