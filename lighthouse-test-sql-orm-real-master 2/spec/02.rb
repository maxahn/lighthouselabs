require './spec_helper'

describe Suite do

  subject(:suite) { FactoryGirl.build :suite }

  describe '#number' do
    it "is required" do
      suite.number = nil
      suite.should_not be_valid
      suite.errors[:number].should == ["can't be blank"]
    end
    it "cant be longer than 4 letters" do
      suite.number = '13555' # 5 letters
      suite.should_not be_valid
      suite.errors[:number].should == ["is too long (maximum is 4 characters)"]
    end
    it "must be unique" do
      another_suite = FactoryGirl.create :suite
      suite.number = another_suite.number

      suite.should_not be_valid
      suite.errors[:number].should == ['has already been taken']
    end
  end

  describe '#rate' do
    it "is required to be number" do
      suite.rate = nil
      suite.should_not be_valid
      suite.errors[:rate].should == ["is not a number"]
    end

    it "cannot be zero (must be greater)" do
      suite.rate = 0
      suite.should_not be_valid
      suite.errors[:rate].should == ["must be greater than 0"]
    end

    it "must be a number (integer) only" do
      suite.rate = 'abc'
      suite.should_not be_valid
      suite.errors[:rate].should == ["is not a number"]
    end
  end

  describe '#capacity' do
    it "is required to be number" do
      suite.capacity = nil
      suite.should_not be_valid
      suite.errors[:capacity].should == ["is not a number"]
    end

    it "cannot be zero (must be greater)" do
      suite.capacity = 0
      suite.should_not be_valid
      suite.errors[:capacity].should == ["must be greater than 0"]
    end

    it "must be a number (integer) only" do
      suite.capacity = 'abc'
      suite.should_not be_valid
      suite.errors[:capacity].should == ["is not a number"]
    end
  end

end
