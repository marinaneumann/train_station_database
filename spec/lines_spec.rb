require 'spec_helper'

describe Line do
  it "initializes an instance of Lines and returns the characteristics" do
    new_line = Line.new({:name=> "blue"})
    expect(new_line).to be_an_instance_of Line
    expect(new_line.name).to eq 'blue'
  end

  it "starts with an empty array" do
    expect(Line.all).to eq []
  end

  it "adds a train line" do
    new_line = Line.new({:name=> "blue"})
    new_line.save
    expect(Line.all).to eq [new_line]
  end

  it "makes similar objects the same" do
    new_line = Line.new({:name=> "blue"})
    new_line2 = Line.new({:name=> "blue"})
    expect(new_line).to eq new_line2
  end


  it 'adds stations into a line' do
    new_station = Station.new({:name => 'Nacho Land'})
    new_station.save
    new_line = Line.new({:name => 'Green'})
    new_line.save
    new_station1 = Station.new({:name => 'Lunch Heaven'})
    new_station1.save
    new_station2 = Station.new({:name => 'Beat Street'})
    new_station2.save
    new_line.add_station(new_station.id)
    expect(new_line.get_stations).to eq [new_station]
  end

  it 'shows the correlation between lines and stations' do

  end

  describe '.find' do
    it 'returns the line from the database with the matching id' do
      line = Line.new({:name => 'work', :id => 1})
      line.save
      expect(Line.find(line.id)).to eq line
    end
  end

end
