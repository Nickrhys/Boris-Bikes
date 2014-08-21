class Bike

	attr_accessor :serial

	def initialize()
		fix!
		@serial = generate_serial
	end 

	def broken?
		@broken 
	end

	def break!
		@broken = true
	end	

	def fix!
		@broken = false
	end


	def generate_serial
		"#{[*"A".."Z"].sample(2).join}-#{rand(9999)}"
	end

end