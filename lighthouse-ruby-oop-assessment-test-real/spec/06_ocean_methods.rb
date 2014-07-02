require './spec_helper'

describe Ocean do

  describe '::fish' do 

    it 'returns a giant salmon if there is an S at the position' do 
      fish = Ocean.fish(1, 3)
      fish.should be_a(GiantSalmon)
    end
    it 'returns a giant tuna if there is a T at the position' do
      fish = Ocean.fish(2, 0)
      fish.should be_a(GiantTuna)
    end
    it 'returns nothing if there is nothing (~) at the position' do
      fish = Ocean.fish(1, 1)
      fish.should be_nil
    end

  end

end