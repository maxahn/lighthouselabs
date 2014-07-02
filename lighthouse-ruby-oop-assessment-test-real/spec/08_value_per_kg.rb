require './spec_helper'

describe GiantTuna do
  
  subject(:tuna) { GiantTuna.new }

  its(:value_per_kg) { should eq(12.5) }

end

describe GiantSalmon do
  
  subject(:salmon) { GiantSalmon.new }

  its(:value_per_kg) { should eq(7.5) }
  
end

describe Fish do
  
  subject(:fish) { Fish.new(5, 50) }

  its(:value_per_kg) { should eq(10.0) }
  
end