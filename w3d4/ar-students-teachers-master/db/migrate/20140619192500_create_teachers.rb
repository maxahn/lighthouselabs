require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateTeachers < ActiveRecord::Migration
  def up
    # Code to create the table here:
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    #   # column definitions go here
    #   # Use the AR migration guide for syntax reference
    end
  end

  def down
    # Code to drop the table here
    # Use the AR migration guide for syntax reference
    drop_table :teachers
  end
end