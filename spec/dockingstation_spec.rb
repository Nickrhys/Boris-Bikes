require 'dockingstation'

describe DockingStation do

	let (:station) 	{DockingStation.new}
	let (:bike)				{double :bike}

	it 'does not have bikes' do
		expect(station).to_not have_bike
	end

	it 'can dock bikes' do
		station.dock(bike)
		expect(station).to have_bike
	end

	it 'can release bikes' do
		station.dock(bike)
		station.release(bike)
		expect(station).to_not have_bike
	end
end