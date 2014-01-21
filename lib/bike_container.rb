module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity=value.to_f
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Full" if full?
		raise "Not a bike" if bike.class != Bike
		bikes << bike
	end

	def release(bike)
		raise "This bike is not in this container" if !bikes.include?(bike)
		bikes.delete(bike)
	end

	def full? 
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end

	def give_broken_bikes
		broken_bikes.each{|bike| release(bike)}
	end

	def give_working_bikes
		available_bikes.each{|bike| release(bike)}
	end
end