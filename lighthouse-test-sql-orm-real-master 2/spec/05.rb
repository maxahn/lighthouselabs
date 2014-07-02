require './spec_helper'

describe Booking do

  subject(:booking) { FactoryGirl.build :booking }

  describe '#nights' do
    it "is 1 when checkout date is day after checkin date" do
      booking.nights.should == 1
    end

    it "is 3 when checkout date is 3 days after checkin date" do
      booking.checkin  = Date.today
      booking.checkout = 3.days.from_now.to_date
      booking.nights.should == 3
    end
  end

  describe '#market_cost' do
    it "should be calculated based on nights and suite rate (ignoring any discounts)" do
      booking.suite.rate = 110
      booking.checkin    = Date.today
      booking.checkout   = 3.days.from_now.to_date

      booking.market_cost.should == 330
    end
  end

  describe '#final_cost' do
    it "should include discount_per_night" do
      booking.checkin            = Date.today
      booking.checkout           = 3.days.from_now.to_date
      booking.suite.rate         = 110
      booking.discount_per_night = 10

      booking.final_cost.should == 300
    end
  end

end
