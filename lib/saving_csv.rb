class SavingCSV
	require 'csv'

	def census
		bikes = []
		ObjectSpace.each_object do |object|
			bikes << object if object.class == Bike
		end
		bikes
	end

	def save_to_csv
		CSV.open("bikes.csv", "wb") do |csv|
			csv_content.each {|line| csv << line}
		end
	end

	def csv_content
		census.map do |bike|
			condition = bike.broken? ? "broken" : "working"
			[bike.object_id, bike.serial, condition]
		end
	end
end



# CSV.open("bikes.csv", "wb"){|csv| csv <<["hi","how","are","you"]}