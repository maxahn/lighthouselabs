require './spec_helper'

describe Suite do

  subject!(:suite) { FactoryGirl.create :suite }
  let!(:booking1) { FactoryGirl.create :previous_booking, suite: suite }
  let!(:booking2) { FactoryGirl.create :previous_booking, suite: suite }
  let!(:booking_for_another_suite) { FactoryGirl.create :booking }

  describe '#bookings' do
    it "are destroyed once suite is destroyed" do
      suite.destroy

      Booking.find_by_id(booking1.id).should be_nil
      Booking.find_by_id(booking2.id).should be_nil
      Booking.find_by_id(booking_for_another_suite.id).should be_a(Booking)
    end
  end

end
