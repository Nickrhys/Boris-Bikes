require 'dockingstation'

describe DockingStation do

	it 'does not have bikes' do
		station = DockingStation.new
		expect(station).to_not have_bike
	end

	it 'can dock bikes' do
		station = DockingStation.new
		bike = double :bike
		station.dock(bike)
		expect(station).to have_bike
	end
end