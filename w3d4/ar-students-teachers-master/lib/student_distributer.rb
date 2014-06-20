def distribute
  total_teachers = Teacher.count
  count = 1
  Student.all.each do |student|
    if count > total_teachers
      count = 1
    end
      student.teacher_id = count
      count += 1
    end
  end
end
