require './spec_helper'

### Custom SQL that gets executed in this test.
# This method should return the correct SQL string.
# PLEASE EDIT THE SQL IN THIS METHOD. ONLY EDIT THIS METHOD
def custom_sql
  "SELECT bookings.full_name FROM bookings ORDER BY checkin DESC LIMIT 1;"
end

# Executes your custom_sql. DO NOT EDIT
def booking_with_furthest_checkin_date
  ActiveRecord::Base.connection.exec_query(custom_sql).collect &:values
end

describe 'Custom SQL Method: #booking_with_furthest_checkin_date' do

  let!(:booking1) { FactoryGirl.create :booking, full_name: 'A', checkin: 13.days.from_now.to_date }
  let!(:booking2) { FactoryGirl.create :booking, full_name: 'B', checkin: 01.days.from_now.to_date }
  let!(:booking3) { FactoryGirl.create :booking, full_name: 'C', checkin: 05.days.from_now.to_date }
  let!(:booking4) { FactoryGirl.create :booking, full_name: 'D', checkin: 30.days.from_now.to_date }
  let!(:booking5) { FactoryGirl.create :booking, full_name: 'E', checkin: 3.days.ago.to_date }

  it "returns the name of the one booking that has the most distant checkin date" do
    # Expect all 5 store names (single column rows)
    booking_with_furthest_checkin_date.should == [
      ['D']
    ]
  end

end
