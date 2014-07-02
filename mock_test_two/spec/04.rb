require './spec_helper'

describe Employee do

  subject(:employee) { FactoryGirl.build :employee }

  describe '#first_name' do
    it "is required" do
      employee.first_name = nil
      employee.should_not be_valid
      employee.errors[:first_name].should == ["can't be blank"]
    end
  end

  describe '#last_name' do
    it "is required" do
      employee.last_name = nil
      employee.should_not be_valid
      employee.errors[:last_name].should == ["can't be blank"]
    end
  end


end
