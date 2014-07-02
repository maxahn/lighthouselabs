require './spec_helper'

### Custom SQL that gets executed in this test.
# This method should return the correct SQL string.
# PLEASE EDIT THE SQL IN THIS METHOD. ONLY EDIT THIS METHOD
def custom_sql
  "SELECT stores.name FROM stores ORDER BY (stores.female_employees + stores.male_employees) DESC;"
end

# Executes your custom_sql. DO NOT EDIT
def names_ordered_by_most_employees_first
  ActiveRecord::Base.connection.exec_query(custom_sql).collect &:values
end

describe 'Custom SQL Method: #names_ordered_by_most_employees_first' do

  let!(:store1) { FactoryGirl.create :store, name: 'A', female_employees: 5, male_employees: 5 }  # 10 total
  let!(:store2) { FactoryGirl.create :store, name: 'B', female_employees: 2, male_employees: 0 }  # 2 total
  let!(:store3) { FactoryGirl.create :store, name: 'C', female_employees: 6, male_employees: 0 }  # 6 total
  let!(:store4) { FactoryGirl.create :store, name: 'D', female_employees: 3, male_employees: 4 }  # 7 total
  let!(:store5) { FactoryGirl.create :store, name: 'E', female_employees: 0, male_employees: 12 } # 12 total

  it "returns list of store names (only) ordered by TOTAL number of employees working there" do
    # Expect all 5 store names (single column rows)
    names_ordered_by_most_employees_first.should == [
      ['E'], # row 1
      ['A'], # row 2
      ['D'], # row 3
      ['C'], # row 4
      ['B']  # row 5
    ]
  end


end
