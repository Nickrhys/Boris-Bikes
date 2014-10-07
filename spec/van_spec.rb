require './lib/van'

describe Van do           
                        
  let(:van)            {Van.new(:capacity => 123)       }
  let(:bike)           {double :bike                    }
  let(:station)        {DockingStation.new              } # TODO doubles for docking station
  let(:garage)         {Garage.new                      } # and garage
  let(:broken_bike)    { double :bike, :broken? => true }
  let(:available_bike) { double :bike, :broken? => false}
  
  it "should allow setting default capacity on initializing" do
    expect(van.capacity).to eq(123)
  end

  it "should collect broken bikes from docking station" do
    station.dock(broken_bike) 
    van.pickup_from_dock(station)
    expect(van.broken_bikes.count).to eq(1)
    expect(station.broken_bikes.count).to eq(0)
  end

  it "should deliver working bikes to docking station" do
    van.dock(available_bike)
    van.deliver_to_dock(station)
    expect(station.available_bikes.count).to eq (1)
    expect(van.available_bikes.count).to eq (0)
  end

  it "should collect working bikes from the garage" do
    garage.dock(available_bike)
    van.pickup_from_garage(garage)
    expect(van.available_bikes.count).to eq (1)
    expect(garage.available_bikes.count).to eq (0)
  end

  it "should deliver broken bikes to garage" do
    van.dock(broken_bike)
    van.deliver_to_garage(garage)
    expect(garage.broken_bikes.count).to eq (1)
    expect(van.broken_bikes.count).to eq(0)
  end
end