require 'pry'
RSpec.describe PawnSimulator do
  let(:place) { PawnSimulator.new.place(x: 3, y: 3, face: 'NORTH', color: 'BLACK') }

  it "test method place" do
    expect(place).to eq({:location=>[3, 3], :face=>"NORTH", :color=>"BLACK"})
  end
end

