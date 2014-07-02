require './spec_helper'

describe Submarine do
  
  subject(:submarine) { Submarine.new }

  describe 'default vertical position' do 
    its(:tile) { should eq(0) } # on the surface
  end

  describe 'lateral movement' do 
    
    describe '#forward' do
      it 'does not affect the depth of the sub' do 
        submarine.depth = 2
        submarine.forward
        submarine.depth.should eq(2)
      end

      it 'moves the sub forward (towards the right) in the ocean' do 
        submarine.forward
        submarine.tile.should eq(1)
      end

      it "doesn't allow the sub to move past the right edge of the ocean" do
        submarine.tile = 9
        submarine.forward
        submarine.tile.should eq(9)
      end
    end

    describe '#backward' do
      it 'does not affect the depth of the sub' do 
        submarine.depth = 3
        submarine.backward
        submarine.depth.should eq(3)
      end

      it 'moves the sub backward (towards the left) in the ocean' do 
        submarine.tile = 4
        submarine.backward
        submarine.tile.should eq(3)
      end

      it "doesn't allow the sub to move past the left edge of the ocean" do
        submarine.tile = 0
        submarine.backward
        submarine.tile.should eq(0)
      end
    end

  end
end