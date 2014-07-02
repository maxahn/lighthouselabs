require './spec_helper'

describe Fish do
  
  describe 'weighing 1 pound and worth 15 dollars' do 
    subject(:fish) { Fish.new(1, 15) }
    its(:weight)   { should eq(1)    }
    its(:value)    { should eq(15)   }
  end

  describe 'weighing 3 pounds and worth 25 dollars' do 
    subject(:fish) { Fish.new(3, 25) }
    its(:weight)   { should eq(3)    }
    its(:value)    { should eq(25)   }
  end

end
