require './spec_helper'

describe Store do

  subject!(:store) { FactoryGirl.build :store }

  describe '#annual_profit' do
    it "is calculated on the fly based on annual_revenue and annual_expense" do
      store.should_receive(:annual_revenue).and_return (1_000_000)
      store.should_receive(:annual_expense).and_return (400_000)

      store.annual_profit.should == 600_000
    end
  end

end
