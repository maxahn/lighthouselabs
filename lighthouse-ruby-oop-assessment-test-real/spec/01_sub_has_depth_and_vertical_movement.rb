require './spec_helper'

describe Submarine do
  
  subject(:submarine) { Submarine.new }

  describe 'default vertical position' do 
    its(:depth) { should eq(0) } # on the surface
  end

  describe 'vertical movement' do 
    
    describe '#dive!' do
      it 'submerges the submarine into the water' do 
        submarine.dive!
        submarine.depth.should eq(1)
      end

      it "can't do anything if the submarine is already submerged" do
        submarine.depth = 2
        submarine.dive!
        submarine.depth.should eq(2)
      end
    end

    describe '#surface' do 
      it 'brings the sub out of the water if its just below the surface' do 
        submarine.depth = 1
        submarine.surface
        submarine.depth.should eq(0)
      end

      it "can't surface the submarine when its in deeper waters" do 
        submarine.depth = 2
        submarine.surface
        submarine.depth.should eq(2)
      end
    end

    describe '#descend' do
      it 'takes the sub deeper into the ocean' do 
        submarine.depth = 2
        submarine.descend
        submarine.depth.should eq(3)
      end
      it "only works if the submarine is under water" do 
        submarine.descend
        submarine.depth.should eq(0)
      end
    end

    describe '#ascend' do
      it 'allows the sub to get closer to the surface' do 
        submarine.depth = 2
        submarine.ascend
        submarine.depth.should eq(1)
      end
      it "only works if the submarine is under water and not directly under the surface" do 
        submarine.depth = 1
        submarine.ascend
        submarine.depth.should eq(1)
      end
      it "doesn't work if the submarine is already on the surface" do 
        submarine.ascend
        submarine.depth.should eq(0)
      end
    end

  end
end