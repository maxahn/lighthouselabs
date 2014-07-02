require './spec_helper'

describe Submarine do
  
  subject(:submarine) { Submarine.new }

  its(:total_revenue) { should eq(0) }

  describe '#sell_cargo' do

    it 'is allowed on the surface' do
      submarine.sell_cargo.should eq(true)
    end

    it 'is not allowed under water' do
      submarine.dive!
      submarine.sell_cargo.should eq(false)
    end

    it 'should empty out the cargo' do 
      submarine.cargo = [GiantSalmon.new, GiantTuna.new, GiantSalmon.new]
      submarine.sell_cargo
      submarine.cargo.should eq([])
    end

    it "should increase the sub's total revenue by the appropriate amount" do 
      submarine.total_revenue = 105
      submarine.cargo = [GiantSalmon.new, GiantTuna.new, GiantSalmon.new] # 85
      submarine.sell_cargo
      submarine.total_revenue.should eq(190)
    end

  end

end
