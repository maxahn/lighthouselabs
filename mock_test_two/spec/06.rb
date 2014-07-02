require './spec_helper'

describe Store do

  subject!(:store) { FactoryGirl.create :store }
  let!(:male_employee) { FactoryGirl.create :employee, gender: 'M', store: store }
  let!(:female_employee) { FactoryGirl.create :employee, gender: 'F', store: store }

  describe '#female_employees' do
    it "decreases by 1 when a female employee is removed" do
      store.female_employees.should == 1
      female_employee.destroy
      store.female_employees.should == 0
    end
    it "does not decrease when a male employee is removed" do
      store.female_employees.should == 1
      male_employee.destroy
      store.female_employees.should == 1
    end
  end

  describe '#male_employees' do
    it "decreases by 1 when a male employee is removed" do
      store.male_employees.should == 1
      male_employee.destroy
      store.male_employees.should == 0
    end
    it "does not decrease when a female employee is removed" do
      store.male_employees.should == 1
      female_employee.destroy
      store.male_employees.should == 1
    end
  end

end
