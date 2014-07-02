require './spec_helper'

describe Store do

  subject(:store) { FactoryGirl.create :store }
  let(:male_employee) { FactoryGirl.build :employee, gender: 'M', store: store }
  let(:female_employee) { FactoryGirl.build :employee, gender: 'F', store: store }

  describe '#female_employees' do
    it "increases by 1 when a female employee is added" do
      female_employee.save
      store.female_employees.should == 1
    end
    it "does not increase when a male employee is added" do
      male_employee.save
      store.female_employees.should == 0
    end
    it "does not increase when a female employee is UPDATED" do
      female_employee.save # creates
      female_employee.first_name = "something else"
      female_employee.save # updates
      store.female_employees.should == 1
    end
  end

  describe '#male_employees' do
    it "increases by 1 when a male employee is added" do
      male_employee.save
      store.male_employees.should == 1
    end
    it "does not increase when a female employee is added" do
      female_employee.save
      store.male_employees.should == 0
    end
    it "does not increase when a male employee is UPDATED" do
      male_employee.save # creates
      male_employee.first_name = "someting else"
      male_employee.save # updates
      store.male_employees.should == 1
    end
  end

end
