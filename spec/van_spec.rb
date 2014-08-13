require './lib/van'

describe Van do
	
	let (:van) {Van.new(:capacity => 123)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}
	let(:garage) {Garage.new}
	it "should allow setting default capacity on initializing" do
		expect(van.capacity).to eq(123)
	end

	# it "should collect broken bikes from docking station" do
	# 	van.accept(@broken_bike)
	# end

	it "should collect broken bikes from docking station" do
		bike.break!
		station.dock(bike)
		van.pickup_from_dock(station)
		expect(van.broken_bikes.count).to eq(1)
		expect(station.broken_bikes.count).to eq(0)
	end

	it "should deliver working bikes to docking station" do
		van.dock(bike)
		van.deliver_to_dock(station)
		expect(station.available_bikes.count).to eq (1)
		expect(van.available_bikes.count).to eq (0)
	end

	it "should collect working bikes from the garage" do
		garage.dock(bike)
		van.pickup_from_garage(garage)
		expect(van.available_bikes.count).to eq (1)
		expect(garage.available_bikes.count).to eq (0)
	end

	it "should deliver broken bikes to garage" do
		bike.break! 
		van.dock(bike)
		van.deliver_to_garage(garage)
		expect(garage.broken_bikes.count).to eq (1)
		expect(van.broken_bikes.count).to eq(0)
	end
end