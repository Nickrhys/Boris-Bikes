require 'saving_csv'
require 'borisbikes'

describe SavingCSV do

	let(:saver) {SavingCSV.new}
	let!(:bike) {Bike.new}

	it 'should know what bikes exist' do
		expect(saver.census).to include bike
	end

	it 'should be able to save to csv' do
		expect(CSV).to receive(:open).with("bikes.csv", "wb")
		saver.save_to_csv
	end

	it 'should be able to create the contents of a csv file' do
		object_id =  bike.object_id
		serial = bike.serial
		expect(saver.csv_content).to include [object_id, serial, "working"]
	end

	end