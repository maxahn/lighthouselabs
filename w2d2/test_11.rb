require './spec_helper'

describe Barracks do 

  subject(:barracks) do
    Barracks.new
  end

  subject(:footman) do
    Footman.new
  end

  it 'barrracks hp starts at 500' do
    expect(barracks.health_points).to eq(500)
  end

  describe '#damage' do

    it 'footman does Half of its AP as damage to Barracks' do
      original_health = barracks.health_points
      footman.attack!(barracks)
      expect(barracks.health_points).to eq(original_health - 5)
    end


  end
end