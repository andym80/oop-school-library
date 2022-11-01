require_relative 'person'

class Student < Person
  def initialize(classroom, age, parent_permission, name = 'Unknown')
    @classroom = classroom
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
