require_relative 'person'

class Student < Person
  def initialize(age, classroom, parent_permission = true, name = 'Unknown')
    @classroom = classroom
    super(
       @age = age,
      @classroom = classroom,
      @name = name,
      @parent_permission = parent_permission
  )
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
