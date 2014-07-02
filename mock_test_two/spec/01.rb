require './spec_helper'

describe Employee do

  subject(:employee) { Employee.new }
  let(:store) { Store.new }

  describe "associations" do

    it "should be able to get their store" do
      expect { employee.store }.not_to raise_error
    end

    it "should be able to set their store" do
      expect { employee.store = store }.not_to raise_error
    end

  end

end
