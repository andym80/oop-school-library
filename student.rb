require_relative 'person'


class Student < Person
  attr_reader :classroom, :rentals

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(
      @age = age,
      @name = name
  )
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end


  def play_hooky
    '¯(ツ)/¯'
  end
end
