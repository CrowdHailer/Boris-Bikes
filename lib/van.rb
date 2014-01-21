require_relative 'bike_container'

class Van

	include BikeContainer
	
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def get_broken_bikes(location)
		location.give_broken_bikes.each{|bike| dock(bike)}
	end

	def give_bikes(location)
		give_broken_bikes.each {|bike| location.dock(bike)}
	end

	def get_fixed_bikes(location)
		location.give_working_bikes.each{|bike| dock(bike)}
	end
end