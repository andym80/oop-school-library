require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
    super(
      @age = age,
      @parent_permission = parent_permission,
      @name = name
  )
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
