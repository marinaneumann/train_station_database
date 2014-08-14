require 'spec_helper'

describe Station do
  it 'initializes a new station and returns the characteristics' do
    new_station = Station.new({:name => 'Powell'})
    expect(new_station).to be_an_instance_of Station
    expect(new_station.name).to eq 'Powell'
  end

  it 'starts with an empty array of stations' do
    expect(Station.all).to eq []
  end

  it 'adds a station' do
    new_station = Station.new({:name => 'Grand Central Station'})
    new_station.save
    expect(Station.all).to eq [new_station]
  end

  it 'makes similiar objects the same' do
    new_station = Station.new({:name => 'Grand Central Station'})
    new_station1 = Station.new({:name => 'Grand Central Station'})
    expect(new_station).to eq new_station1
  end


end
