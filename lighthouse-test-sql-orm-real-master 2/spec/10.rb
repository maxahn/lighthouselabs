require './spec_helper'

describe Suite do
  subject!(:suite) { FactoryGirl.create :suite }

  describe '#available?' do
    context "without any bookings" do
      it "should be considered available for any date" do
        suite.available?(Date.today).should be_true
      end
    end
    context "with a 2 night booking" do
      let!(:booking) { FactoryGirl.create :booking, suite: suite, checkin: Date.today, checkout: 2.days.from_now.to_date  }
      it "should be considered unavailable on the checkin date" do
        suite.available?(Date.today).should be_false
      end

      it "should be considered unavailable on the checkout date" do
        suite.available?(2.days.from_now.to_date).should be_false
      end

      it "should be considered available prior to the checkin date" do
        suite.available?(1.day.ago.to_date).should be_true
      end

      it "should be considered available after the checkin date" do
        suite.available?(3.days.from_now.to_date).should be_true
      end



    end

  end

end
