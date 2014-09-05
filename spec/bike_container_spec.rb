require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new } # described.class
	let(:other_bike) {Bike.new}
	let(:holder) { ContainerHolder.new }

	def fill_holder(holder)
		10.times { holder.dock(Bike.new)}
		# holder.capacity (or holderdefault.capacity) instead of 20
	end

	it "should accept a bike" do
		# we expect the holder to have 0 bikes
		expect(holder.empty?).to eq true
		# let's dock a bike into the holder
		holder.dock(bike)
		# now we expect the holder to have 1 bike
		expect(!holder.empty?).to eq true
	end 

	it "should release bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.empty?).to eq true
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide a list of available bikes" do
		other_bike.break!
		holder.dock(bike)
		holder.dock(other_bike)
		expect(holder.available_bikes).to eq([bike])
	end

	it "should provide a list of broken bikes" do
		other_bike.break!
		holder.dock(bike)
		holder.dock(other_bike)
		expect(holder.broken_bikes).to eq([other_bike])
	end

	it "should know when it's empty" do
		expect(lambda { holder.release(bike) }).to raise_error(RuntimeError)
	end

	# it "should only accept bikes" do
	# 	expect(lambda { holder.dock(holder) }).to raise_error(RuntimeError)
	# end
end

