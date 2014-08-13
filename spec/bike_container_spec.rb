require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new } # described.class
	let(:holder) { ContainerHolder.new }

	def fill_holder(holder)
		10.times { holder.dock(Bike.new)}
		# holder.capacity (or holderdefault.capacity) instead of 20
	end

	it "should accept a bike" do
		# we expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		# let's dock a bike into the holder
		holder.dock(bike)
		# now we expect the holder to have 1 bike
		expect(holder.bike_count).to eq(1)
	end 

	it "should release bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide a list of available bikes" do
		working_bike, @broken_bike = Bike.new, Bike.new
		@broken_bike.break!
		holder.dock(working_bike)
		holder.dock(@broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end
end
