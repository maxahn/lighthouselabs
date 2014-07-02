require './spec_helper'

describe Employee do

  let(:senior_employee) { FactoryGirl.build :employee, hourly_rate: 50 }
  let(:junior_employee) { FactoryGirl.build :employee, hourly_rate: 25 }

  describe '#annual_salary' do
    it "is calculated on the fly based on hourly_wage x 1950 (max billable hours in a year)" do
      senior_employee.annual_salary.should == 97_500
      junior_employee.annual_salary.should == 48_750
    end
  end

end

describe Store do

  subject!(:store) { FactoryGirl.create :store }
  let!(:senior_employee) { FactoryGirl.create :employee, hourly_rate: 50, store: store }
  let!(:junior_employee) { FactoryGirl.create :employee, hourly_rate: 25, store: store }

  describe '#annual_expense' do
    it "is calculated on the fly based on employee annual salaries" do
      store.annual_expense.should == 146_250
    end
  end

end
