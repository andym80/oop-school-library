require_relative 'person'

class Student < Person
  def initialize(id, classroom)
    @id = id
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
