class DockingStation

	def initialize(bike=nil)
		@bike = [bike]
	end

	def has_bike?
		@bike.any?
	end

	def dock(bike)
		@bike << bike
	end	

	def release(bike)
		@bike.pop
	end

end