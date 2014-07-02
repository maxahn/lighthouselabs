require './spec_helper'

describe Suite do

  subject!(:suite) { FactoryGirl.create :suite }

  describe "#destroy" do

    context "with active bookings" do

      let!(:booking) { FactoryGirl.create :current_booking, suite: suite }

      it "should NOT be allowed" do
        suite.destroy
        Suite.find_by_id(suite.id).should be_a(Suite)

        suite.errors[:base].should == ["This suite has an active booking and thus can't be deleted"]
      end

    end

    context "with previous bookings" do

      let!(:booking) { FactoryGirl.create :previous_booking, suite: suite }

      it "should be allowed" do
        suite.destroy.should be_true
        Suite.find_by_id(suite.id).should be_nil
      end

    end


  end

end
