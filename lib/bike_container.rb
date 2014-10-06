module BikeContainer 

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count 
	end
 
	def dock(bike)
		raise "Station is full" if full?
		bikes << bike
	end	

	def release(bike)
		raise "Station is Empty" if bikes.empty?
		bikes.delete(bike)
	end

	def full?
		available_bikes.count + broken_bikes.count == capacity
	end

 	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end

	def broken_bikes
		bikes.select {|bike| bike.broken? }
	end

	def empty?
		bikes.count == 0
	end


end

