require './lib/bike_container'

class ContainerHolder
	include BikeContainer
end

describe BikeContainer do
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end


	it "should not release a bike that's not there" do
		expect(lambda {holder.release(bike)}).to raise_error(RuntimeError)
	end

	it "should not release a bike that's not there" do
		expect(lambda {holder.release("orange")}).to raise_error(RuntimeError)
	end

	it "should raise an error if we are docking a gorilla" do
		expect(lambda {holder.dock("gorilla")}).to raise_error(RuntimeError)
	end

	it "should be created empty" do
		expect(holder).to be_empty
	end

	it "should return an inventory of all broken bikes" do
		bike.break
		holder.dock(bike)
		expect(holder.broken_bikes).to eq([bike])
	end

	it "should empty the broken bikes" do
		bike2 = Bike.new
		bike2.break
		holder.dock(bike)
		holder.dock(bike2)
		expect(holder.give_broken_bikes).to eq([bike2])
	end

end