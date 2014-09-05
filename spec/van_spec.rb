require './lib/van'

describe Van do
	
	let(:van) 		{Van.new(:capacity => 123)	}
	# let(:bike) 		{= double ('bike')			}
	# let(:station) 	{DockingStation.new			}
	let(:garage) 	{Garage.new					}
	# let(:broken_bike) {:bike, :broken? => true}
	it "should allow setting default capacity on initializing" do
		expect(van.capacity).to eq(123)
	end

	# it "should collect broken bikes from docking station" do
	# 	van.accept(@broken_bike)
	# end

	it "should collect broken bikes from docking station" do
		broken_bike = double :bike
		allow(broken_bike).to receive(:broken?).and_return(true)
		station = double :station 
		expect(station).to receive(:broken_bikes).and_return([broken_bike])
		expect(station).to receive(:release).with(broken_bike).and_return(broken_bike)
		van.pickup_from_dock(station)
		expect(van.broken_bikes.count).to eq(1)
		# expect(station.broken_bikes.count).to eq(0)
	end

	xit "should deliver working bikes to docking station" do
		van.dock(bike)
		van.deliver_to_dock(station)
		expect(station.available_bikes.count).to eq (1)
		expect(van.available_bikes.count).to eq (0)
	end

	it "should collect working bikes from the garage" do
		available_bike = double :bike 
		allow(available_bike).to receive(:broken?).and_return(false)
		garage.dock(available_bike)
		van.pickup_from_garage(garage)
		expect(van.available_bikes.count).to eq (1)
		expect(garage.available_bikes.count).to eq (0)
	end

	xit "should deliver broken bikes to garage" do
		bike.break! 
		van.dock(bike)
		van.deliver_to_garage(garage)
		expect(garage.available_bikes.count).to eq (1)
		expect(van.broken_bikes.count).to eq(0)
	end
end