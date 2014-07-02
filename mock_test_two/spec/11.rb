require './spec_helper'

### Custom SQL that gets executed in this test.
# This method should return the correct SQL string.
# PLEASE EDIT THE SQL IN THIS METHOD. ONLY EDIT THIS METHOD
def custom_sql
  # "SELECT employees.first_name, stores.name FROM employees, stores WHERE employees.store_id = stores.id;"

  "SELECT employees,first_name, stores.name FROM employees JOIN stores ON stores.id = employees.store_id;"
end

# Executes your custom_sql. DO NOT EDIT
def employee_first_names_and_store_names
  ActiveRecord::Base.connection.exec_query(custom_sql).collect &:values
end

describe 'Custom SQL Method: #employee_first_names_and_store_names' do

  let!(:store1) { FactoryGirl.create :store, name: 'A'}

  let!(:employeeA_1) { FactoryGirl.create :employee, first_name: 'A1', store: store1 }
  let!(:employeeA_2) { FactoryGirl.create :employee, first_name: 'A2', store: store1 }
  let!(:employeeA_3) { FactoryGirl.create :employee, first_name: 'A3', store: store1 }

  let!(:store2) { FactoryGirl.create :store, name: 'B'}

  let!(:employeeB_x) { FactoryGirl.create :employee, first_name: 'Bx', store: store2 }
  let!(:employeeB_y) { FactoryGirl.create :employee, first_name: 'By', store: store2 }
  let!(:employeeB_z) { FactoryGirl.create :employee, first_name: 'Bz', store: store2 }

  # NOTE: The following 2 employees DONT HAVE A STORE and should NOT be returned
  let!(:employeeC_a) { FactoryGirl.create :employee, first_name: 'Ca', store: nil }
  let!(:employeeC_b) { FactoryGirl.create :employee, first_name: 'Cb', store: nil }

  it "returns list of employee first names along with the name of the store they are working at. Employees that are not working at a store should not be included in the result set." do

    employee_first_names_and_store_names.should == [
      ['A1', 'A'],
      ['A2', 'A'],
      ['A3', 'A'],
      ['Bx', 'B'],
      ['By', 'B'],
      ['Bz', 'B']
    ]
  end


end
