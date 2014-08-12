require "docking_station"

describe DockingStation do
	let(:bike) { Bike.new}
	let(:station) {DockingStation.new}

	 it "should accept bike" do
		# we expect the station to have 0 bikes
		expect(station.bike_count).to eq(0)
		# let's nock a bike into the station
		station.dock(bike)
		# now we expect the station to have 1 bike
		expect(station.bike_count).to eq(1)
	 end

	 it "should release a bike" do
	 	station.dock(bike)
	 	station.release(bike)
	 	expect(station.bike_count).to eq (0)
	 end
		
end