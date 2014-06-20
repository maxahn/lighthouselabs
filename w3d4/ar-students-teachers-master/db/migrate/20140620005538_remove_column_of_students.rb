require_relative '../../config'

class RemoveColumnOfStudents < ActiveRecord::Migration
  def change
    remove_reference :students, :teacher
  end
end