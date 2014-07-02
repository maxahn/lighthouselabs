require './spec_helper'

describe GiantTuna do
  subject(:tuna) { GiantTuna.new }

  it { should be_a(Fish) }

  its(:weight) { should eq(2)  }
  its(:value)  { should eq(25) }
end