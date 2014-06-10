require './spec_helper'

describe Unit do 

  subject(:unit) do
    Unit.new(80, 10)
  end

  describe '#dead?' do
    it 'dies when hp hits 0' do
      unit.should_receive(:health_points).and_return(0)
      expect(unit.dead?).to be_true
    end
  end

  describe '#dead?' do
    it 'dies when hp hits below 0' do
      unit.should_receive(:health_points).and_return(-25)
      expect(unit.dead?).to be_true
    end
  end
end