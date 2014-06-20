class Student < ActiveRecord::Base
  # implement your Student model here

  validates :email, uniqueness: true, :email_format => {:message => 'is not looking good'}
  validate :at_least_3
  belongs_to :teacher

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end


  def at_least_3
    if age <= 3
      errors.add(:birthdate, 'You must be 3 years or older.')
    end
  end

  # def self.distribute
  #   total_teachers = Teacher.count
  #   count = 1
  #   Student.all.each do |student|
  #     if count > total_teachers
  #       count = 1
  #     end
  #     student.teacher_id = count
  #     student.save
  #     count += 1 
  #   end
  # end

  #delete column in student table, use migrate.
  #create new table
  #has two columns, student_id, teacher_id


end
