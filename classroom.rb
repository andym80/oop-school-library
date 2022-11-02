class Classroom
  attr_accessor :label
  attr_reader :students

  def initialized(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
  end
end
