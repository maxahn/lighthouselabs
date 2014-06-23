require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateHistories < ActiveRecord::Migration
#name of class is very important
  def change
    create_table :histories do |t|
      t.string :url
      
      t.timestamps  
    end
  end
end
