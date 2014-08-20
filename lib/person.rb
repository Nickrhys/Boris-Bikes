class Person 

	def initialize(bike=nil)
		bike.nil? ? @bike = [] : @bike = [bike] 
	end

	def has_bike?
		@bike.any?
	end 

	def fall_down
		@bike.first.break!
	end

	def rent_bike_from(station)
		@bike << station.release_bike
	end

	def return_bike(station)
		station.dock(@bike.pop)
	end
end 
# Nick and Maya fudge the system again