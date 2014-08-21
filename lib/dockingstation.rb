class DockingStation

	def initialize
		@bikes = []
	end

	def capacity
		@capacity = 20
	end

	def bike_count
		@bikes.count
	end

	def has_bike?
		@bikes.any?
	end

	def dock(bike)
		raise "Station is Full" if self.full? == true
		# rescue RuntimeError => |e|
		# 	puts e.message
		@bikes << bike
	end

	def release(bike)
		raise "Station is Empty" if self.has_bike? == false
		@bikes.pop
	end

	def full?
		bike_count == capacity 
	end

	def available_bikes
		@bikes.reject { |bike| bike.broken? } 
	end

	# amended docking station



end

# to be continued