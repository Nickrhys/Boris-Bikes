require './lib/docking_station'

describe DockingStation do

	let(:station) {DockingStation.new(:capacity => 123)} 

	it "should allow setting defult capaity on initializing" do
		expect(station.capacity).to eq(123)
	end
end
	# def fill_station(station)
	# 	20.times { station.dock(Bike.new) }
	# end	

	#  it "should accept bike" do
	# 	# we expect the station to have 0 bikes
	# 	expect(station.bike_count).to eq(0)
	# 	# let's nock a bike into the station
	# 	station.dock(bike)
	# 	# now we expect the station to have 1 bike
	# 	expect(station.bike_count).to eq(1)
	#  end

	#  it "should release a bike" do
	#  	station.dock(bike)
	#  	station.release(bike)
	#  	expect(station.bike_count).to eq (0)
	#  end

	#  it "should know when it's full" do
	#  	expect(station).not_to be_full
	# 	fill_station station 
	# 	expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	# end

	# it "should provide the list of available bikes" do
	# 	working_bike, broken_bike = Bike.new, Bike.new
	# 	broken_bike.break!
	# 	station.dock(working_bike)
	# 	station.dock(broken_bike)
	# 	expect(station.available_bikes).to eq([working_bike])		
	# end




