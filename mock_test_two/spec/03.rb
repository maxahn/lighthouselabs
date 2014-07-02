require './spec_helper'

describe Store do

  subject(:store) { FactoryGirl.build :store }

  describe '#name' do
    it "is required" do
      store.name = nil
      store.should_not be_valid
      store.errors[:name].should == ["can't be blank"]
    end
    it "cant be longer than 25 letters" do
      store.name = 'a' * 26
      store.should_not be_valid
      store.errors[:name].should == ["is too long (maximum is 25 characters)"]
    end
  end

  describe '#annual_revenue' do
    it "cannot be negative (that would be weird!)" do
      store.annual_revenue = -100
      store.should_not be_valid
      store.errors[:annual_revenue].size.should == 1
    end

    it "could be zero (that would be sad)" do
      store.annual_revenue = 0
      store.should be_valid
    end

    it "must be a number (integer) only" do
      store.annual_revenue = 'abc'
      store.should_not be_valid
      store.errors[:annual_revenue].should == ["is not a number"]
    end
  end

  describe '#male_employees' do
    it "cannot be negative (that would be weird!)" do
      store.male_employees = -100
      store.should_not be_valid
      store.errors[:male_employees].size.should == 1
    end

    it "could be zero (that would be sad)" do
      store.male_employees = 0
      store.should be_valid
    end

    it "must be a number (integer) only" do
      store.male_employees = 'abc'
      store.should_not be_valid
      store.errors[:male_employees].should == ["is not a number"]
    end
  end

  describe '#female_employees' do
    it "cannot be negative (that would be weird!)" do
      store.female_employees = -100
      store.should_not be_valid
      store.errors[:female_employees].size.should == 1
    end

    it "could be zero (that would be sad)" do
      store.female_employees = 0
      store.should be_valid
    end

    it "must be a number (integer) only" do
      store.female_employees = 'abc'
      store.should_not be_valid
      store.errors[:female_employees].should == ["is not a number"]
    end
  end

end
