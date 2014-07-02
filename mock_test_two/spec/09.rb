require './spec_helper'

describe Employee do

  let!(:male1) { FactoryGirl.create :senior_male_employee } # rate = 20
  let!(:male2) { FactoryGirl.create :junior_male_employee } # rate = 10
  let!(:male3) { FactoryGirl.create :junior_male_employee } # rate = 10

  let!(:female1) { FactoryGirl.create :junior_female_employee } # rate = 12
  let!(:female2) { FactoryGirl.create :senior_female_employee } # rate = 22

  describe '.average_hourly_rate_for(gender)' do
    it "calculates average hourly rate for Male" do
      Employee.average_hourly_rate_for('M').to_f.should == 13.33
    end
    it "calculates average hourly rate for Female" do
      Employee.average_hourly_rate_for('F').to_f.should == 17
    end
    it "calculates average hourly rate for both Male and Female if nil is passed in (5% BONUS)" do
      Employee.average_hourly_rate_for(nil).to_f.should == 14.8
    end
  end

end
