require './lib/garage'

describe Garage do

	let (:garage) {Garage.new(:capacity => 123)}
	let (:broken_bike) {Bike.new}
	it "should allow setting default capacity on initializing" do
		expect(garage.capacity).to eq(123)
	end	
	
	it "should fix bikes" do
		broken_bike.break!
		garage.dock(broken_bike)
		garage.fix_bikes!
		expect(broken_bike.broken?).to eq false
	end


end