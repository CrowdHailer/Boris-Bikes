require_relative "../lib/van"

describe Van do
	let(:van) { Van.new(:capacity => 10) }
	let(:test_station) do
		st = DockingStation.new(:capacity =>20)
		10.times{ st.dock(Bike.new)}
		4.times do
			bike = Bike.new
			bike.break
			st.dock(bike)
		end
		st
	end
	let(:garage) { Garage.new(:capacity => 100) }

	it "should allow setting default capacity on init" do
		expect(van.capacity).to eq(10)
	end

	it "should empty a stations broken bikes" do
	 	van.get_broken_bikes(test_station)
	 	expect(van.bike_count).to eq(4)
	end

	it "should give broken bikes to garage" do
		van.get_broken_bikes(test_station)
		van.give_bikes(garage)
		expect(garage.bike_count).to eq(4)
	end

	it "should empty a stations working bikes" do
	 	test_station.give_working_bikes.each{|bike| van.dock(bike)}
	 	expect(van.bike_count).to eq(10)
	end
	
	it "should throw an error when adding bikes to a full van" do 
		10.times{van.dock(Bike.new)}
		expect{van.dock(Bike.new)}.to raise_error
	end
end