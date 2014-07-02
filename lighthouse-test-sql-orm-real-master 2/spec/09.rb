require './spec_helper'

### Custom SQL that gets executed in this test.
# This method should return the correct SQL string.
# PLEASE EDIT THE SQL IN THIS METHOD. ONLY EDIT THIS METHOD
def custom_sql
  "SELECT bookings.full_name FROM bookings WHERE julianday(bookings.checkout) - julianday(bookings.checkin) < 2;"
end

# Executes your custom_sql. DO NOT EDIT
def single_night_bookings_only
  ActiveRecord::Base.connection.exec_query(custom_sql).collect &:values
end

describe 'Custom SQL Method: #single_night_bookings_only' do

  let!(:a) { FactoryGirl.create :booking, full_name: 'A', checkin: Date.today, checkout: 13.days.from_now.to_date }
  let!(:b) { FactoryGirl.create :booking, full_name: 'B', checkin: Date.today, checkout: 01.days.from_now.to_date }
  let!(:c) { FactoryGirl.create :booking, full_name: 'C', checkin: Date.today, checkout: 05.days.from_now.to_date }
  let!(:d) { FactoryGirl.create :booking, full_name: 'D', checkin: Date.today, checkout: 30.days.from_now.to_date }
  let!(:e) { FactoryGirl.create :booking, full_name: 'E', checkin: Date.today, checkout: 01.days.from_now.to_date }

  it "returns all bookings that are only for one night" do
    # Expect all 5 store names (single column rows)
    single_night_bookings_only.should == [
      ['B'],
      ['E']
    ]
  end

end
