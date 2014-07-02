require './spec_helper'

describe GiantSalmon do
  subject(:salmon) { GiantSalmon.new }

  it { should be_a(Fish) }

  its(:weight) { should eq(4)  }
  its(:value)  { should eq(30) }
end