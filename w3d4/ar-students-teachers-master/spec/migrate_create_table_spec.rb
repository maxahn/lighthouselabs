require 'rspec'
require_relative '../config'


describe "create table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "should have a Students table" do
    ActiveRecord::Base.connection.table_exists?(:students).should be_true
  end

  it "should have the right columns and types" do

    expected = {
      id: :integer,
      first_name: :string,
      last_name: :string,
      gender: :string,
      email: :string,
      phone: :string,
      birthday: :date,
      created_at: :datetime,
      updated_at: :datetime
    }

    actual_columns = ActiveRecord::Base.connection.columns(:students)
    expected.each do |column_name, data_type|
      column = actual_columns.detect {|c| c.name == column_name.to_s && c.type == data_type }
      column.should_not be_nil, "Expected column #{column_name} of type #{data_type} to be in the table, but no dice!"
    end

  end



end
