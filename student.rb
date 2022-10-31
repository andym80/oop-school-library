require_relative 'person'

class Student < Person
  def initialize(classroom)
    @classroom = classroom
    super(
      @age = age,
      @name = name,
      @parent_permission = parent_permission
  )
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
