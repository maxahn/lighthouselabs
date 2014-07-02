require './spec_helper'

describe Submarine do
  
  subject(:submarine) { Submarine.new }

  its(:cargo)  { should eq([]) } # empty Array

  let(:salmon) { GiantSalmon.new }
  let(:tuna)   { GiantTuna.new }

  describe '#fish' do 
    
    it 'calls Ocean.fish with its current position' do 
      submarine.depth = 3
      submarine.tile = 4

      Ocean.should_receive(:fish).with(3, 4)
      submarine.fish
    end

    it 'adds the fished Salmon to its cargo' do 
      submarine.dive!
      submarine.cargo = [tuna]
      Ocean.should_receive(:fish).and_return(salmon)
      submarine.fish
      submarine.cargo.should eq([tuna, salmon])
    end
    
    it 'returns false if the ship is not submerged' do
      Ocean.should_not_receive(:fish)
      submarine.fish
    end

  end
end