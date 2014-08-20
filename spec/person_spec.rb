require 'person'

describe Person do

	let(:person)           	{Person.new}
	let(:bike)				{double :bike}
	let(:station)			{double :station, :release_bike => bike, :receive_bike => bike}
	let(:person_with_bike) 	{Person.new(bike)}
		
	it 'does not have a bike' do
		expect(person).to_not have_bike
	end

	it 'has a bike' do 
		expect(person_with_bike).to have_bike
	end 

	it 'can break a bike' do 
		expect(bike).to receive(:break!)
		person_with_bike.fall_down
	end

	it 'can rent a bike' do
		# expect(station).to receive(:release_bike)
		person.rent_bike_from(station)
	end

	it 'can have a bike after renting one' do
		# expect(station).to receive(:release_bike).and_return(bike)
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it 'can return a bike' do
		expect(station).to receive(:dock).with bike
		person_with_bike.return_bike(station)
	end


	it 'will not have a bike after returning one' do
		allow(station).to receive(:dock).with bike

		person_with_bike.return_bike(station)
		expect(person_with_bike).to_not have_bike
	end 
end

