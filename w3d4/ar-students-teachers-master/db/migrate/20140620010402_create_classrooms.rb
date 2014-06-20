require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateClassrooms < ActiveRecord::Migration
  def up
    # Code to create the table here:
    create_table :classrooms do |t|
      t.timestamps
    end
    add_reference :classrooms, :student
    add_reference :classrooms, :teacher    
    
    #   # column definitions go here
    #   # Use the AR migration guide for syntax reference
    
  end

  def down
    # Code to drop the table here
    # Use the AR migration guide for syntax reference
    drop_table :classrooms
  end
end
