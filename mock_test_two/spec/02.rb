require './spec_helper'

describe Store do

  subject(:store) { Store.new }

  describe "associations" do

    it "should be able to get their employees" do
      expect { store.employees }.not_to raise_error
    end

    it "should be able to set their employees" do
      expect { store.employees.new }.not_to raise_error
    end

  end

end
