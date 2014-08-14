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


end
