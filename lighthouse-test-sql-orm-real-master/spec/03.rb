require './spec_helper'

describe Booking do

  subject(:booking) { FactoryGirl.build :booking }

  describe '#full_name' do
    it "is required" do
      booking.full_name = nil
      booking.should_not be_valid
      booking.errors[:full_name].should == ["can't be blank"]
    end

    it "is a max of 50 characters" do
      booking.full_name = 'a' * 51
      booking.should_not be_valid
      booking.errors[:full_name].should == ["is too long (maximum is 50 characters)"]
    end
  end

  describe '#guests' do
    it "is required as a number" do
      booking.guests = nil
      booking.should_not be_valid
      booking.errors[:guests].should == ["is not a number"]
    end

    it "is at least 1" do
      booking.guests = 0
      booking.should_not be_valid
      booking.errors[:guests].should == ["must be greater than 0"]
    end

    it "is at most 4" do
      booking.guests = 5
      booking.should_not be_valid
      booking.errors[:guests].should == ["must be less than 5"]
    end
  end


end
