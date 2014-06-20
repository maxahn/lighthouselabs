require_relative '../../config'

class AddColumnToStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.references :teacher
    end
  end
end