require 'borisbikes'

describe Bike do

	let(:bike)  {Bike.new}

	it 'is not broken' do 
		expect(bike).not_to be_broken 
	end 

	it 'can be broken' do
		bike.break!
		expect(bike).to be_broken 
	end

	it 'can be fixed' do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end

	it 'should have a serial number' do
		expect(bike.serial).to match /^[A-Z]{2}-[\d]{4}$/
	end


end

# Nick and Maya fudge the system