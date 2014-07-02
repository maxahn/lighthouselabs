require './spec_helper'

describe Booking do

  subject(:booking) { Booking.new }
  let(:suite) { Suite.new }

  describe "associations" do
    it "should be able to get their suite" do
      expect { booking.suite }.not_to raise_error
    end

    it "should be able to set their suite" do
      expect { booking.suite = suite }.not_to raise_error
    end
  end

end

describe Suite do

  subject(:suite) { Suite.new }

  describe "associations" do
    it "should be able to get their bookings" do
      expect { suite.bookings }.not_to raise_error
    end

    it "should be able to set their bookings" do
      expect { suite.bookings.new }.not_to raise_error
    end
  end

end
