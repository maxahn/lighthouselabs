require './spec_helper'


describe Suite do

  subject!(:suite) { FactoryGirl.create :suite }
  let!(:booking1) { FactoryGirl.build :booking, suite: suite }
  let!(:booking2) { FactoryGirl.build :booking, suite: suite }
  let!(:booking_for_another_suite) { FactoryGirl.build :booking }

  describe '#revenue' do
    it "is increased by booking's final_cost when a booking is created" do
      suite.revenue.should == 0

      booking1.should_receive(:final_cost).and_return(100)
      booking1.save

      suite.reload.revenue.should == 100

      booking2.should_receive(:final_cost).and_return(200)
      booking2.save

      suite.revenue.should == 300
    end
    it "is not increased by some other suite's booking" do
      suite.revenue.should == 0

      booking_for_another_suite.save

      suite.reload.revenue.should == 0
    end
    it "is decreased by booking's final_cost if booking is destroyed" do
      booking1.stub(:final_cost).and_return(100)
      booking1.save

      suite.update_attributes! revenue: 5100

      booking1.destroy # suite revenue should reduce by 100

      suite.reload.revenue.should == 5000
    end
  end

end

describe Booking do

  context 'without a suite' do
    subject(:booking) { FactoryGirl.build :booking, suite: nil }

    describe 'creation' do
      it "should work fine" do
        booking.save
        booking.should be_valid
      end
    end

    describe 'destruction' do
      it "should work fine" do
        booking.save
        booking.destroy
        Booking.find_by_id(booking.id).should be_nil
      end
    end
  end

end
