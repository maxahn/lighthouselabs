class Classroom < ActiveRecord::Base
  # implement your Student model here
  validates_uniqueness_of :student_id, :scope => :teacher_id
  belongs_to :teacher
  belongs_to :student
  
  def self.distribute

    for x in 1...100 do
      total_teachers = Teacher.count
      total_students = Student.count

      t = 1 + rand(total_teachers)
      s = 1 + rand(total_students)

      Classroom.create(student_id: s, teacher_id: t)
      
    end
  end

end
