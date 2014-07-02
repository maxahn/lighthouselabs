require './spec_helper'

### Custom SQL that gets executed in this test.
# This method should return the correct SQL string.
# PLEASE EDIT THE SQL IN THIS METHOD. ONLY EDIT THIS METHOD
def custom_sql
  "SELECT bookings.full_name, suites.number FROM bookings LEFT OUTER JOIN suites ON bookings.suite_id = suites.id;"
end  

# Executes your custom_sql. DO NOT EDIT
def bookings_with_suite_numbers
  ActiveRecord::Base.connection.exec_query(custom_sql).collect &:values
end

describe 'Custom SQL Method: #bookings_with_suite_numbers' do

  let!(:s1) { FactoryGirl.create :suite, number: '100' }
  let!(:s2) { FactoryGirl.create :suite, number: '200' }
  let!(:s3) { FactoryGirl.create :suite, number: '300' }

  let!(:a) { FactoryGirl.create :booking, full_name: 'A', suite: s2 }
  let!(:b) { FactoryGirl.create :booking, full_name: 'B', suite: s1 }
  let!(:c) { FactoryGirl.create :booking, full_name: 'C', suite: s2 }
  let!(:d) { FactoryGirl.create :booking, full_name: 'D', suite: s2 }
  let!(:e) { FactoryGirl.create :booking, full_name: 'E', suite: nil }

  it "returns all booking names along with their suite number (including bookings with no suite assigned)" do
    # Expect all 5 store names (single column rows)
    bookings_with_suite_numbers.should == [
      ['A', '200'],
      ['B', '100'],
      ['C', '200'],
      ['D', '200'],
      ['E', nil]
    ]
  end

end
