require './spec_helper'

describe Unit do

  subject(:unit) do
    Unit.new(80, 10)
  end

  subject(:enemy) do
    Unit.new(80, 10)
  end

  describe '#attack!' do
    it 'cannot attack another unit if dead' do
      unit.should_receive(:dead?).and_return(true)
      expect(unit.attack!(enemy)).to be_false
    end

    it 'cannot attack a dead unit' do
      enemy.should_receive(:dead?).and_return(true)
      expect(unit.attack!(enemy)).to be_false
    end
  end
  
end