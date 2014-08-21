require 'dockingstation'

describe DockingStation do

	let (:station) 			{DockingStation.new}
	let (:bike)				{double :bike}
	let (:working_bike)		{double :bike, broken?: false}
	let (:broken_bike)		{double :bike, broken?: true}

	def fill_station(station)
		station.capacity.times { station.dock(bike)}
	end

	it 'does not have bikes' do
		expect(station.bike_count).to eq 0
	end

	it 'can dock bikes' do
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it 'can release bikes' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it 'should know when it is full' do
		20.times { station.dock(bike) }
	end

	it 'should know it is empty' do
		expect(station.has_bike?).to be false
	end

	it 'should not release a bike when empty' do
		station.bike_count == 0
		expect(lambda { station.release(bike) }).to raise_error(RuntimeError)
	end

	it 'should not accept a bike if it is full' do
		fill_station(station)
		expect(-> { station.dock(bike) }).to raise_error(RuntimeError) 
	end

	it "should know which docked bikes are broken and which are not" do
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq ([working_bike])
	end




end

# amended docking station